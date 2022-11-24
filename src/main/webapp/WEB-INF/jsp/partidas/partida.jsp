<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:lo2 pageName="partidas">

    <div style = "font-family: 'Dalek Pinpoint', sans-serif; font-size: 20px;text-align: center; height: 200;">

        <div style="font-size: 35px">
            <c:out value="${principal.name}"/>
        </div>

        <table class="table table-striped">
            <tr>
                <td style="background: #e2861e">Votos a favor del cesar:  <c:out value="${partida.votosFavorCesar}"/></td>
                <td style="background: #cecbc8 ">Votos contra el cesar:  <c:out value="${partida.votosContraCesar}"/></td>
                <td style="background: #e2861e">Limite de votos:  <c:out value="${partida.limite}"/></td>
            </tr>
        </table>

        <h2 style = "font-family: 'Dalek Pinpoint', sans-serif; font-size: 20px;">Ronda:  <c:out value="${partida.ronda}"/></h2>
        <h2 style = "font-family: 'Dalek Pinpoint', sans-serif; font-size: 20px;">Turno:  <c:out value="${partida.turno}"/></h2>

        <div style="text-align:left">
            Jugadores de la partida:
            <div>
                <c:forEach items="${partida.jugadores}" var="jugador">
                    <tr style = "text-align: left; ";>
                        <td>
                            <div>
                                <c:out value="${jugador.user.username}"/> -  <c:out value="${jugador.rol}"/>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </div>
        </div>

        <c:if test="${jugadorLog.rol.getName() == 'Consul'}">
            <c:if test = "${faccionApoyada == null}">
                <a class="btn btn-default" href="/partidas/jugar/consul/${partida.id}">Siguiente</a>
            </c:if>
        </c:if>
        <c:if test="${jugadorLog.rol.getName() == 'Edil'}">
            <c:if test = "${numVotos == 0}">
                <a class="btn btn-default" href="/partidas/jugar/edil/${partida.id}">Siguiente</a>
            </c:if>
        </c:if>
        <c:if test="${jugadorLog.rol.getName() == 'Pretor'}">
            <c:if test = "&{partida.fase==0}">
                <a class="btn btn-default" href="/partidas/jugar/pretor/${partida.id}">Siguiente</a>
            </c:if>
        </c:if>
        
    </div>
   
</petclinic:lo2>