class ApiEndpoints {
  static String baseUrl = 'https://qgfhhtdlmnbfwflexduz.supabase.co/rest/v1/';
  static String projectsPath = 'projects';
  static String getProjects() =>
      'projects?select=*,profiles!creator_id(full_name)';
  static String getProjectByID(String projectId) =>
      'projects/$projectId?select=*,profiles!creator_id(full_name)';
  static String deleteProject(String projectId) => 'projects?id=eq.$projectId';
}

enum HttpMethod { GET, POST, PUT, DELETE }
