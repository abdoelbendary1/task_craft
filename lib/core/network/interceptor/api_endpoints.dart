// lib/core/network/interceptor/api_endpoints.dart

class ApiEndpoints {
  // الروابط الأساسية (Base URLs)
  static const String restBaseUrl = 'https://qgfhhtdlmnbfwflexduz.supabase.co/rest/v1';
  static const String authBaseUrl = 'https://qgfhhtdlmnbfwflexduz.supabase.co/auth/v1';

  // ==========================================
  // مسارات الـ AUTH (استخدم الروابط الكاملة هنا)
  // ==========================================
  static const String login = '$authBaseUrl/token?grant_type=password';
  static const String signUp = '$authBaseUrl/signup';
  static const String user = '$authBaseUrl/user';
  static const String logout = '$authBaseUrl/logout';

  // ==========================================
  // مسارات الـ PROJECTS (تعتمد على restBaseUrl)
  // ==========================================
  static const String projects = '/projects';
  
  static String getProjects() => 
      '/projects?select=*,profiles!creator_id(full_name)';
      
  static String deleteProject(String projectId) => 
      '/projects?id=eq.$projectId';

  // ==========================================
  // مسارات الـ TASKS (تعتمد على restBaseUrl)
  // ==========================================
  static const String tasks = '/tasks';
  
  static String getTasks(String projectId) => 
      '/tasks?project_id=eq.$projectId&select=*';
      
  static String updateOrDeleteTask(String taskId) => 
      '/tasks?id=eq.$taskId';

  // ==========================================
  // مسارات الـ PROFILES (تعتمد على restBaseUrl)
  // ==========================================
  static String getProfile(String userId) => 
      '/profiles?id=eq.$userId';
}