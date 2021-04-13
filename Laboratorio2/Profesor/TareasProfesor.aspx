﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TareasProfesor.aspx.cs" Inherits="Laboratorio2.TareasProfesor" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>

     <script>
        function AJAX() {
            if (XMLHttpRequest) {
                xhr = new XMLHttpRequest();
                var asignatura = document.getElementById("DropDownList1").value;
                xhr.open('GET', '../AJAX/GridView.aspx?asig=' + asignatura, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        document.getElementById('GridView1').innerHTML = xhr.responseText;
                    }
                }
                xhr.send('');
            }
         }

         setInterval(function () {
             if (XMLHttpRequest) {
                 xhr = new XMLHttpRequest();
                 xhr.open('GET', '../AJAX/UsuariosConectados.aspx', true);
                 xhr.onreadystatechange = function () {
                     if (xhr.readyState == 4 && xhr.status == 200) {
                         document.getElementById('Usuarios').innerHTML = xhr.responseText;
                     }
                 }
                 xhr.send('');
             }  
         }, 5000);

     </script>

<body>
    <form id="form1" runat="server">
        <div style="height: 134px; width: 1298px; margin-left: 9px; background-color: #C0C0C0; font-size: 23px; color: #000000; text-align: inherit; vertical-align: middle;">
            <p style="margin-left: 560px">
                PROFESOR</p>
            <p style="margin-left: 520px">
                GESTIÓN DE TAREAS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Cerrar sesión" />
            </p>
            <p style="margin-left: 560px">
                GENÉRICOS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
        </div>
        <p style="margin-top: 16px">
            Seleccionar asignatura:</p>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="codigoasig" DataValueField="codigoasig"  onChange="AJAX();" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-15ConnectionString %>" SelectCommand="SELECT codigoasig FROM GruposClase
WHERE codigo in (SELECT Codigogrupo FROM ProfesoresGrupo WHERE ProfesoresGrupo.Email = @email)
">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="Correo" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="asignaturas" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:HADS21-15ConnectionString %>" DeleteCommand="DELETE FROM [TareasGenericas] WHERE [Codigo] = @original_Codigo AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL)) AND (([CodAsig] = @original_CodAsig) OR ([CodAsig] IS NULL AND @original_CodAsig IS NULL)) AND (([HEstimadas] = @original_HEstimadas) OR ([HEstimadas] IS NULL AND @original_HEstimadas IS NULL)) AND (([Explotacion] = @original_Explotacion) OR ([Explotacion] IS NULL AND @original_Explotacion IS NULL)) AND (([TipoTarea] = @original_TipoTarea) OR ([TipoTarea] IS NULL AND @original_TipoTarea IS NULL))" InsertCommand="INSERT INTO [TareasGenericas] ([Codigo], [Descripcion], [CodAsig], [HEstimadas], [Explotacion], [TipoTarea]) VALUES (@Codigo, @Descripcion, @CodAsig, @HEstimadas, @Explotacion, @TipoTarea)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig) " UpdateCommand="UPDATE [TareasGenericas] SET [Descripcion] = @Descripcion, [CodAsig] = @CodAsig, [HEstimadas] = @HEstimadas, [Explotacion] = @Explotacion, [TipoTarea] = @TipoTarea WHERE [Codigo] = @original_Codigo AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL)) AND (([CodAsig] = @original_CodAsig) OR ([CodAsig] IS NULL AND @original_CodAsig IS NULL)) AND (([HEstimadas] = @original_HEstimadas) OR ([HEstimadas] IS NULL AND @original_HEstimadas IS NULL)) AND (([Explotacion] = @original_Explotacion) OR ([Explotacion] IS NULL AND @original_Explotacion IS NULL)) AND (([TipoTarea] = @original_TipoTarea) OR ([TipoTarea] IS NULL AND @original_TipoTarea IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Codigo" Type="String" />
                <asp:Parameter Name="original_Descripcion" Type="String" />
                <asp:Parameter Name="original_CodAsig" Type="String" />
                <asp:Parameter Name="original_HEstimadas" Type="Int32" />
                <asp:Parameter Name="original_Explotacion" Type="Boolean" />
                <asp:Parameter Name="original_TipoTarea" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Codigo" Type="String" />
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="CodAsig" Type="String" />
                <asp:Parameter Name="HEstimadas" Type="Int32" />
                <asp:Parameter Name="Explotacion" Type="Boolean" />
                <asp:Parameter Name="TipoTarea" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="CodAsig" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="CodAsig" Type="String" />
                <asp:Parameter Name="HEstimadas" Type="Int32" />
                <asp:Parameter Name="Explotacion" Type="Boolean" />
                <asp:Parameter Name="TipoTarea" Type="String" />
                <asp:Parameter Name="original_Codigo" Type="String" />
                <asp:Parameter Name="original_Descripcion" Type="String" />
                <asp:Parameter Name="original_CodAsig" Type="String" />
                <asp:Parameter Name="original_HEstimadas" Type="Int32" />
                <asp:Parameter Name="original_Explotacion" Type="Boolean" />
                <asp:Parameter Name="original_TipoTarea" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Size="Medium" Height="66px" Text="Insertar nueva tabla" Width="179px" OnClick="Button1_Click" />
        </p>
        <p>
            &nbsp;</p>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="asignaturas" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="margin-right: 2px">
            <Columns>
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
            </Columns>
        </asp:GridView>
        <br />
    </form>
    <div id="Usuarios">
    </div>
</body>
</html>
