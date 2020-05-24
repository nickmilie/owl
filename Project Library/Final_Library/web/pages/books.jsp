<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="web.enums.SearchType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="web.beans.Book"%>
<!DOCTYPE html>

<jsp:useBean id="bookList" class="web.beans.BookList" scope="page"/>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page 2</title>
        <link href="../assets/css/patern_style.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        


        <div class="wrapper">
            <header class="list_header">
            <h1> List of books</h1>
            </header>
            <div class="inner">
                <div class="book_list">
                    <%
                        request.setCharacterEncoding("UTF-8");

                        ArrayList<Book> list = null;

                        if (request.getParameter("genre_id") != null) {
                            long genreId = Long.valueOf(request.getParameter("genre_id"));
                            list = bookList.getBooksByGenre(genreId);
                        } else if (request.getParameter("letter") != null) {
                            String letter = request.getParameter("letter");
                            list = bookList.getBooksByLetter(letter);
                        } else if (request.getParameter("search_string") != null) {
                            String searchStr = request.getParameter("search_string");
                            SearchType type = SearchType.TITLE;

                            if (searchStr != null && !searchStr.trim().equals("")) {
                                list = bookList.getBooksBySearch(searchStr, type);
                            }
                        }
                    %>
                    <!--<h5 style="text-align: left; margin-top:20px;">Найдено книг: <%=list.size()%> </h5>-->
                    <%
                        session.setAttribute("currentBookList", list);
                        for (Book book : list) {

                    %>

                    <div class="book_info">
                        <div class="book_title">
                            <p> <%=book.getName()%></p>
                        </div>
                        <div class="book_image">
                            <a href="#"><img src="<%=request.getContextPath()%>/ShowImage?index=<%=list.indexOf(book)%>" height="250" width="190" alt="Обложка"/></a>
                        </div>
                        <div class="book_details">
                            <br><strong>ISBN:</strong> <%=book.getIsbn()%>
                            <br><strong>Издательство:</strong> <%=book.getPublisher()%>

                            <br><strong>Количество страниц:</strong> <%=book.getPageCount()%>
                            <br><strong>Год издания:</strong> <%=book.getPublishDate()%>
                            <br><strong>Автор:</strong> <%=book.getAuthor()%>
                            <p style="margin:10px;">
                                <a  href="<%=request.getContextPath()%>/PdfContent?index=<%=list.indexOf(book)%>"
                                    target="_blank"﻿>Читать</a>
                            </p>
                        </div>
                    </div>
                    <%}%>

                </div>
            </div>
        </div>
    </body>

</html>


