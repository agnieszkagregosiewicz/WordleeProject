<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Gotowy do wyjścia?</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">Wybierz 'wyloguj' jeśli chcesz zakończyć sesję.</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Wróć</button>
        <form action="<c:url value="/logout"/>" method="post">
          <input type="submit" value="Wyloguj">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

      </div>
    </div>
  </div>
</div>
