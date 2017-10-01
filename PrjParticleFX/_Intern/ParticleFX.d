
class C_PARTICLEFX
{
	// Поведение частиц во времени ----------------------------------
	// кол-во частиц
	var float	ppsValue;		// частиц/сек.
	// масштабирование кол-ва частиц
	var string	ppsScaleKeys_s;	// доли от ppsValue в каждую секунду
	// повторять в цикле
	var int		ppsIsLooping;	// =0|1
	// сглаживать
	var int		ppsIsSmooth;	// =0|1
	// скорость воспроизведения ppsScaleKeys_s
	var float	ppsFps;
	// ???
	var string	ppsCreateEm_s;
	var float	ppsCreateEmDelay;
	
	// Пространственное распределение частиц ------------------------
	// форма поверхности, на которой создаются частицы
	var string	shpType_s;		// ="point,line,box,circle,sphere,mesh"
	// должно ли излучение следовать за поворотом поверхности
	var string	shpFor_s;		// ="world,object"
	// вектор смещения локальной системы координат источника излучения
	var string	shpOffsetVec_s;	// ="x y z"
	// распределение излучаемых частиц по поверхности
	var string	shpDistribType_s;	// ="RAND,UNIFORM,WALK"
	// скорость перемещения по поверхности источника излучения
	var float	shpDistribWalkSpeed;
	// должны ли частицы рождаться на всей площади поверхности (1) или только по краю (0)
	var int		shpIsVolume;	// =0|1
	// размер излучаемой поверхности
	var string	shpDim_s;
	// имя файла поверхности 
	var string	shpMesh_s;		// ="name.3ds"
	// производится ли рендеринг поверхности вместе с излучаемыми частицами
	var int		shpMeshRender_b;	// =0|1
	// масштабирование поверхности во времени
	var string	shpScaleKeys_s;
	var int		shpScaleIsLooping;
	var int		shpScaleIsSmooth;
	var float	shpScaleFps;
	
	// Движение частиц ----------------------------------------------
	// направление полета частицы
	var string	dirMode_s;			// ="NONE,RAND,DIR,TARGET,MESH"
	// к чему относится угол полета
	var string	dirFor_s;			// ="world,object"
	// dirMode_s = "TARGET"
	var string	dirModeTargetFor_s;	// ="world,object"
	var string	dirModeTargetPos_s;	// ="x y z"
	// dirMode_s = "DIR"
	var float	dirAngleHead;		// [0..359]
	var float	dirAngleHeadVar;	// [0..179]
	var float	dirAngleELev;		// [-90..90]
	var float	dirAngleELevVar;	// [-90..90]
	// средняя скорость и 
	var float	velAvg;
	// дисперсия скорости полета частиц
	var float	velVar;
	
	// Время жизни частиц -------------------------------------------
	// среднее время
	var float	lspPartAvg;
	// дисперсия
	var float	lspPartVar;
	
	// Полет частиц -------------------------------------------------
	// вектор гравитации в относительной системе координат мира
	var string	flyGravity_s;	// ="x y z"
	// реакция частиц при столкновении
	var int		flyColldet_b;	// =0|1|2|3|4
	// 0 – проверка на столкновение не проводится
	// 1 – тормозящее отражение
	// 2 – ускоряющее отражение
	// 3 – обнуление скорости частицы
	// 4 – удаление частицы
	
	// Визуализация частиц ------------------------------------------
	// имя файла визуализации частиц
	var string	visName_s;			// ="NAME.TGA|.3DS"
	// с какой ориентацией будет производиться рендеринг частиц
	var string	visOrientation_s;	// ="NONE,VELO,VELO3D"
	// тип анимации визуализации текстуры
	var int		visTexIsQuadPoly;
	// скорость анимации частиц
	var float	visTexAniFps;
	// должна ли останавливаться анимация частиц на последнем фрейме
	var int		visTexAniIsLooping;
	// цвет частиц, RGB
	var string	visTexColorStart_s;	// =[0..255,0..255,0..255]
	var string	visTexColorEnd_s;	// =[0..255,0..255,0..255]
	// размер частиц
	var string	visSizeStart_s;		// ="x y"
	var float	visSizeEndScale;	// доля от visSizeStart_s
	// альфа функция частиц
	var string	visAlphaFunc_s;	// ="NONE,BLEND,ADD,MUL"
	var float	visAlphaStart;	// =[0..255]
	var float	visAlphaEnd;	// =[0..255]
	
	// Прочее -------------------------------------------------------
	// визуализация траектории частиц
	var float	trlFadeSpeed;
	var string	trlTexture_s;
	var float	trlWidth;
	// следы от частиц
	var float	mrkFadeSpeed;
	var string	mrkTexture_s;
	var float	mrkSize;
	// ??? влияение на движение частиц каких-либо внешних объектов или явлений (например, ветер)
	var string	flockMode;		// примеры "WIND", "ARMOR_XARDAS.asc"
	var float	flockStrength;
	// включить вычисление положения каждой частицы в месте излучения
	var int		useEmittersFor;
	// временной промежуток, в котором PFX выполняется
	var string	timeStartEnd_s;		// ="час_начала, час_конца"
	// PFX может быть окружающим, т.е. с его помощью строятся погодные эффекты
	var int		m_BisAmbientPfx;	// =0|1
};

