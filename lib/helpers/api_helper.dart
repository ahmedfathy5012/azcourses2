const String BASEURL = "https://coursat.crazyideaco.com/public/api/";

const String LOGIN_ENDPOINT = BASEURL + "login";
const String FIRST_REGISTER_ENDPOINT = BASEURL + "register";
const String SECOND_REGISTER_ENDPOINT = BASEURL + "register_info";
const String STAGE_ENDPOINT = BASEURL + "education_stages";
const String COURSE_RATE = BASEURL + "course_rate";
const String RATE_COURSE = BASEURL + "rate_course";
const String BUY_COURSE = BASEURL + "buycourse";
const String BUY_GENERAL_COURSE = BASEURL + "buygeneralcourse";
const String BUY_CLASS = BASEURL + "buyclass";
const String CALL_US = BASEURL + "sendmessage";

const String CHANGE_PASSWORD = BASEURL + "change_password";
const String PHONE_VERIFY = BASEURL + "phone_verify";
const String CHECK_PHONE_END_POINT = BASEURL + "check_phone";




const String LECTURER_INFO = BASEURL + "lecturer_info";
const String LECTURER_COVER = BASEURL + "lecturer_cover";
const String STATES_ENDPOINT = BASEURL + "states";
const String HOME_ENDPOINT = BASEURL + "home_categories";
const String MY_COURSES_ENDPOINT = BASEURL + "mycourses";
const String NOTIFICATIONS_ENDPOINT = BASEURL + "mynotifications";
const String ALL_LECTURERS_ENDPOINT = BASEURL + "alllecturers";
const String ALL_COURSES_ENDPOINT = BASEURL + "subjectcourses";
const String GENERAL_COURSES_ENDPOINT = BASEURL + "general_courses";
const String INNER_GENERAL_COURSES_ENDPOINT = BASEURL + "getcoursegeneral";
const String SEARCH_ENDPOINT = BASEURL + "searshforcourses";

const String MY_CENTERS_ENDPOINT = BASEURL + "mycenters";
const String CENTER_ENDPOINT = BASEURL + "show_center";
const String ADD_CENTER_ENDPOINT = BASEURL + "addcenter";
const String LOG_OUT_ENDPOINT = BASEURL + "logoutnow";

const String RESET_PASSWORD_ENDPOINT = BASEURL + "forget_password";




const String CLASSES_ENDPOINT = BASEURL + "course_classes";
const String YEARS_ENDPOINT = BASEURL + "years";

const String VIEW_ALL_ENDPOINT = BASEURL + "view_all";

const String VIEW_ALL_IN_TYPE_ENDPOINT = BASEURL + "type";
const String VIEW_ALL_IN_SUBTYPE_ENDPOINT = BASEURL + "suptype";

String TEACHER_VIDEOS_ENDPOINT(int teacherId) =>
    BASEURL + "teacher/videos/paginate/${teacherId}";

String TEACHER_PROFILE_ENDPOINT(int teacherId) =>
    BASEURL + "teacher/videos/profile/${teacherId}";

String VIEW_ALL_CATEGORIES_ENDPOINT(int categoryId) =>
    BASEURL + "subject/videos/${categoryId}";

// String RESET_PASSWORD_ENDPOINT(String email) =>
//     BASEURL + "sendbasicemail/${email}";
