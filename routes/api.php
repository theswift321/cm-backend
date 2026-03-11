<?php
use App\Http\Controllers\Controller;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\Admin\{
    CourseController,
    CategoryController,
    SubjectController,
    SubjectMaterialController,
    UserController,
    PaymentStatsController,
    
};

use App\Http\Controllers\AssignmentController;
use App\Http\Controllers\LessonController;
use App\Http\Controllers\RazorpayWebhookController;
use App\Http\Controllers\Student\{
    CourseCatalogController,
    EnrollmentController,
    StudentCourseController
};
use Illuminate\Support\Facades\Route;
use Google\Client as GoogleClient;
use Illuminate\Http\Request;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

### AUTH
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/forgot-password', [AuthController::class, 'forgotPassword']);
Route::post('/reset-password', [AuthController::class, 'resetPassword']);

Route::get('/reset-password/{token}', function (Request $request, $token) {
    return redirect(
        'http://localhost:4200/reset-password'
        . '?token=' . $token
        . '&email=' . urlencode($request->query('email'))
    );
})->name('password.reset');



// Route::post('/google-login', [AuthController::class, 'googleLogin']);
Route::post('/auth/google', [AuthController::class, 'googleLogin']);


// ---------------------------------------------
// for landing page
// ---------------------------------------------
Route::get('/public/courses/{id}', [CourseController::class, 'publicShow']);
Route::get('/public/categories', [CategoryController::class, 'landingindex']);
// Route::get('/student/course/{id}/enrollment',[EnrollmentController::class, 'isenrolled']);
Route::get('/public/courses', [CourseController::class, 'landingindex']);
Route::post( '/razorpay/webhook',[RazorpayWebhookController::class, 'handle']);

/*
|--------------------------------------------------------------------------
| AUTHENTICATED ROUTES
|--------------------------------------------------------------------------
*/


Route::middleware('auth:sanctum')->group(function () {

    /*
    |--------------------------------------------------------------------------
    | ADMIN ROUTES
    |--------------------------------------------------------------------------
    */
    Route::prefix('admin')->middleware('isAdmin')->group(function () {


         
        Route::get('/SubjectCourseName/{subjectId}/{courseId}',[SubjectController::class,'getsubjectbyId']);

        // Courses
        Route::post('/course', [CourseController::class, 'store']);
        Route::get('/courses', [CourseController::class, 'index']);
        Route::get('/courses/{id}', [CourseController::class, 'getdataById']);
        Route::post('/course/{id}', [CourseController::class, 'update']);
        Route::delete('/course/{id}', [CourseController::class, 'destroy']);

        // Categories
        Route::get('/categories', [CategoryController::class, 'index']);
        Route::post('/categories', [CategoryController::class, 'store']);
        Route::delete('/categories/{id}', [CategoryController::class, 'destroy']);

        // Subjects
        Route::get('/courses/{course}/subjects', [SubjectController::class, 'index']);
        Route::post('/courses/{course}/subjects', [SubjectController::class, 'store']);
        Route::get('/subjects/{subject}', [SubjectController::class, 'show']);
        Route::put('/subjects/{subject}', [SubjectController::class, 'update']);
        Route::delete('/subjects/{subject}', [SubjectController::class, 'destroy']);

        // Subject Materials
        Route::prefix('subjects')->group(function () {
            Route::get('{subject}/materials', [SubjectMaterialController::class, 'index']);
            Route::post('{subject}/materials', [SubjectMaterialController::class, 'store']);
        });
        
        Route::get('/materials/{material}', [SubjectMaterialController::class, 'show']);
        Route::post('/materials/{material}', [SubjectMaterialController::class, 'update']);
        Route::delete('/materials/{material}', [SubjectMaterialController::class, 'destroy']);

        //  Assignment
        Route::post('/assignments',[AssignmentController::class,'storeAssignment']);
        Route::put('/assignments/{id}', [AssignmentController::class, 'update']);
        Route::delete('/assignments/{id}', [AssignmentController::class, 'destroy']);
        Route::get('{subjectId}/assignments/all',[AssignmentController::class,'getallSubjectAssignment']);
        Route::get('/assignment/{id}/submissions', [AssignmentController::class, 'getSubmissions']);
        Route::post('/submission/{id}/review', [AssignmentController::class, 'reviewSubmission']);


            
        // Users
        Route::get('/users', [UserController::class, 'index']);
        Route::put('/users/{id}/status', [UserController::class, 'toggleStatus']);

        Route::prefix('payment-stats')->group(function () {
            Route::get('/summary', [PaymentStatsController::class, 'summary']);
            Route::get('/by-course', [PaymentStatsController::class, 'byCourse']);
            Route::get('/by-student', [PaymentStatsController::class, 'byStudent']);
        });

        Route::post('/exams', [ExamController::class,'store']);
        Route::delete('/exams/{id}',[ExamController::class,'destroy']);
        Route::put('/exams/{id}', [ExamController::class,'update']);
        Route::get('/exams/{id}', [ExamController::class, 'show']);
        Route::get('/exams-list', [ExamController::class,'index']);
        Route::post('/questions', [ExamController::class,'storeQuestion']);
        Route::get('/exams/{examId}/questions',[ExamController::class,'getquestionlist']);

        Route::put('/questions/{id}',[ExamController::class,'updateQuestion']);
        Route::delete('/questions/{id}',[ExamController::class,'destroyQuestion']);


        

    });



    /*
    |--------------------------------------------------------------------------
    | STUDENT ROUTES
    |--------------------------------------------------------------------------
    */
    Route::prefix('student')->middleware('student')->group(function () {

    Route::post('/lessons/{lessonId}/complete', [LessonController::class, 'complete']);
    Route::get('/courses/{courseId}/progress', [LessonController::class, 'getProgress']);
    Route::get('/course/{courseId}/emi', [PaymentController::class, 'getMyEmi']);


        // Course Catalog (browse & enroll)
    Route::get('/courses', [CourseCatalogController::class, 'index']);
    Route::get('/my-courses', [StudentCourseController::class, 'myCourses']);
    Route::post('/enroll', [EnrollmentController::class, 'enroll']);
    // routes/api.php
    Route::get('/course/{id}/enrollment',[EnrollmentController::class, 'isenrolled']);
    Route::middleware('check.overdue.emi')->group(function () {
            Route::get('/course/{course}/material/{material}', [StudentCourseController::class, 'studyMaterial']);
        });
    Route::get('/profile', [StudentController::class, 'show']);
    Route::post('/profile/update', [StudentController::class, 'update']);

    Route::post('/payments/create-order', [PaymentController::class, 'createOrder']);
    Route::post('/payments/verify', [PaymentController::class, 'verify']);
    

    Route::post('/emi/create-order', [PaymentController::class, 'createNextEmiOrder']);
    Route::post('/emi/verify', [PaymentController::class, 'verifyEmiPayment']);
    Route::get('/payments/status/{courseId}',[PaymentController::class,'studentPaymentStatus']);

    Route::get('/courses/{courseId}/assignments', [AssignmentController::class, 'index']);
    Route::get('{subjectId}/assignments/all',[AssignmentController::class,'getallSubjectAssignment']);
    Route::post('assignments/{assignmentId}/submit',[AssignmentController::class,'submit']);

    Route::get('/assignment-stats', [StudentController::class, 'assignmentStats']);
    Route::get('/assignments', [AssignmentController::class, 'studentAssignments']);


    // Route::post('/assignments/{assignmentId}/submit', [AssignmentController::class, 'submit']);

        // (next)
        // Route::post('/enroll', [EnrollmentController::class, 'enroll']);
        // Route::get('/my-courses', [StudentCourseController::class, 'myCourses']);
    });

});
