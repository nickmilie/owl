<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
        <script defer src="https://use.fontawesome.com/releases/v5.8.1/js/all.js" integrity="sha384-g5uSoOSBd7KkhAMlnQILrecXvzst9TdC09/VM+pjDTCM+1il8RHz5fKANTFFb+gQ" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Rubik&amp;subset=cyrillic" rel="stylesheet">
    </head>

    <body>
        <%

            request.setCharacterEncoding("UTF-8");
            String search_String = "";

//            if (request.getParameter("search_string") != null) {
//                searchString = request.getParameter("search_string");
//                session.setAttribute("search_string", searchString);
//            } else if (session.getAttribute("search_string") != null) {
//                searchString = session.getAttribute("search_string").toString();
//            } else {
//                session.setAttribute("search_string", searchString);
//            }
            

        %>
        <div class="wrapper">
            <div class="welcome">
                <h1> Welcome to Library</h1>
                <form class="main_form" name="search_form"  action="pages/books.jsp" method="GET">
                    <div class="search_box">
                        <input class="search_text" placeholder="Type to search" type="text" name="search_string"  value="<%=search_String%>">
                        <button class="btn search_button" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </body>

</html>
