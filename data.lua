
imageFolder = "./Images/"
tColor = {80, 80, 80}
appColor = { 206, 238, 51 }

lastMenu = {}
activeMenu = "Main"

animeTime = 0

studentIndex = 0
classroomIndex = 0
teacherIndex = 0

address = "http://aeservices.azurewebsites.net/api/"
login = ""
password = ""
token = nil

turnData={}
levelData={}
subLevelData={}
schoolYearData={}
classroomData={}
teacherData={}
studentData={}

schoolData = {}
schoolData["name"] = "Jardim de Infância Pequeno Mundo"
schoolData["address"] = "Av. Afonso Pena, 4000 - Centro - Belo Horizonte"
schoolData["fone"] = "(33)3333-33333"
schoolData["foneAlter"] = "(33)4444-4444"
schoolData["email"] = "pequenoMundo@gmail.com"
schoolData["emailAlter"] = "email2@gmail.com"
schoolData["logo"] = "logoSchool.png"
schoolData["site"] = "http://www.escola.com" 
 
--studentData = {
--    { name="Juquinha", code = 1, age=4, gender="male", pictureName = "juquinha.jpeg", teacher = 1, classroom = 3, parents = {"Claudia - (31) 8898-2222", "Pedro - (31) 8898-2222", }, email = "juquinha@email.com", emailAlter = "juquinhaALternativo@email.com", },
--    { name="Ana Clara", code = 2, age=4, gender="female", pictureName = "ana.jpg", teacher = 1, classroom = 2, parents = {"Marcia da Silva - msilva@gmail.com ", "Evandro - (31) 8767-2232", } },
--    { name="Maria Luiza", code = 3, age=5, gender="female", pictureName = "mariaLuiza.jpg", teacher = 2, classroom = 2, parents = {"Jonathan - (31) 5238-2234", "Marcus Paulo - (31) 8898-2342", } },
--    { name="Pedrinho", code = 4, age=5, gender="male", pictureName = "pedrinho.jpeg", teacher = 2, classroom = 3, parents = {"Beatriz Carvalho - skype: b_carvalho", "Adalberto Ferraz - (31) 7348-2234", } },
--}


--classroomData = {
--    { name="Primeiro Período", code = 1, turn = 1, teacher = 1, sublevel = 1, schoolYear = 2, version = 0 },
--    { name="Segundo Período", code = 2, turn = 1, teacher = 2, sublevel = 1, schoolYear = 2, version = 0 },
--    { name="Terceiro Período",  code = 3, turn = 2, teacher = 3, sublevel = 1, schoolYear = 2, version = 0 },
--}

--teacherData = {
--    { name = "D. Alberta", code = 1, email = "dalberta@escola.com", emailAlter = "d.alberta@gmail.com", facebook = "", fone = "(99)99999999", foneAlter = "(88)88888888", pictureName = "teacher1.jpg" },
--    { name = "D. Celia", code = 2, email = "", emailAlter = "", facebook = "", fone = "", foneAlter = "", pictureName = "teacher2.jpg" },
--    { name = "D. Judite", code = 3, email = "", emailAlter = "", facebook = "", fone = "", foneAlter = "", pictureName = "teacher3.jpg" },
--}

--teacherData = {
--    { PRO_NOME = "D. Alberta", PRO_CODIGO = 1, PRO_EMAIL = "dalberta@escola.com", PRO_EMAIL_ALTERNATIVO = "d.alberta@gmail.com", PRO_FACEBOOK = "", PRO_TELEFONE = "(99)99999999", PRO_TELEFONE_ALTERNATIVO = "(88)88888888", PRO_FOTO = "teacher1.jpg" },
--    { PRO_NOME = "D. Celia", PRO_CODIGO = 2, PRO_EMAIL = "", PRO_EMAIL_ALTERNATIVO = "", PRO_FACEBOOK = "", PRO_TELEFONE = "", PRO_TELEFONE_ALTERNATIVO = "", PRO_FOTO = "teacher2.jpg" },
--    { PRO_NOME = "D. Judite", PRO_CODIGO = 3, PRO_EMAIL = "", PRO_EMAIL_ALTERNATIVO = "", PRO_FACEBOOK = "", PRO_TELEFONE = "", PRO_TELEFONE_ALTERNATIVO = "", PRO_FOTO = "teacher3.jpg" },-
--}

--local repository = require("dao.repository")
--teacherData = repository.getAll("AE_PROFESSOR")
--for i=1,#teacherData do
--    print ( teacherData[i].PRO_NOME)
--    print ( teacherData[i].PRO_NOME)
--end



--turnData = {
--    { code = 1, name = "manha", description = "vamos acordar cedo meninos" },
--    { code = 2, name = "tarde", description = "depois do almoço" },
--    { code = 3, name = "noite", description = "a hora que todos os gatos sao pardos" },
--}

--levelData = {
--    { code = 1, name = "Pre-Escola", description = "Bebes ate 5 anos" },
--    { code = 1, name = "Fundamental", description = "de 6 a 10 anos" },    
--}

--subLevelData = {
--    { code = 1, name = "Primeiro Periodo", description = "3 anos", codeLvl = 1 },
--    { code = 2, name = "Segundo Periodo", description = "4 anos", codeLvl = 1 },
--    { code = 3, name = "Terceiro Periodo", description = "5 anos", codeLvl = 1 },
--}

--schoolYearData = {
--    { code = 1, name = "Primeiro semestre 2013", year = 2013 },
--    { code = 2, name = "Segundo semestre 2013", year = 2013 },
--}
 

