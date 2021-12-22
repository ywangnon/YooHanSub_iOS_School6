//<switch-case>

func monthName(of month: Int) -> String
{
    let monthName: String
    
    switch month {
    case 1:
        monthName = "Jan"
    case 2:
        monthName = "Feb"
    case 3:
        monthName = "Mar"
    case 4:
        monthName = "Apr"
    case 5:
        monthName = "May"
    case 6:
        monthName = "Jun"
    case 7:
        monthName = "Jul"
    case 8:
        monthName = "Aug"
    case 9:
        monthName = "Sep"
    case 10:
        monthName = "Oct"
    case 11:
        monthName = "Nov"
    case 12:
        monthName = "Dec"
    default:
        monthName = "Error"
    }
    
    return monthName
}

func finalDay(year: Int, month: Int) -> Int
{
    var leapChk: Bool
    var finalDay: Int
    
    switch year {
    case let x where x%100==0 && x%400==0:
        leapChk = true
    case let x where x%4==0 && x%100==0:
        leapChk = false
    case let x where x%4==0:
        leapChk = true
    default:
        leapChk = false
    }
    
    switch month {
    case 1:
        finalDay = 31
    case 2:
//        switch leapChk {
//        case true:
//            finalDay = 29
//        default:
//            finalDay = 28
//        }
        finalDay = leapChk ? 29 : 28
    case 3:
        finalDay = 31
    case 4:
        finalDay = 30
    case 5:
        finalDay = 31
    case 6:
        finalDay = 30
    case 7:
        finalDay = 31
    case 8:
        finalDay = 31
    case 9:
        finalDay = 30
    case 10:
        finalDay = 31
    case 11:
        finalDay = 30
    case 12:
        finalDay = 31
    default:
        finalDay = 0
    }
    
    return finalDay
}

/// 윤년 구하기
/// 다이어그램의 모양을 조건문으로 그림
/// - Parameter year: 입력 년도
/// - Returns: 윤년, 평년
func isLeapYear(_ year: Int) -> Bool
{
    if year%400 == 0 || (year%4 == 0 && year%100 != 0)
    {
        return true
    } else
    {
        return false
    }
}


print(finalDay(year: 2008, month: 2))



func scoreToGrade(score: Int) -> String
{
    var grade: String = "F"
    
    switch score {
    case 95...100:
        grade = "A+"
    case 90..<95:
        grade = "A"
    case 85..<90:
        grade = "B+"
    case 80..<85:
        grade = "B"
    case 75..<80:
        grade = "C+"
    default:
        grade = "F"
    }
    
    return grade
}

scoreToGrade(score: 98)

//<if 변환>
func oddCheck(num: Int) -> Bool
{
    var chk: Bool = false
    
    switch num {
    case let x where x%2 == 0:
        chk = true
    default:
        false
    }
    
    return chk
}

func strCheck(num1: Int, num2: Int) -> Bool
{
    var chk: Bool = false
    let comp: (Int, Int) = (num1, num2)
    
    switch comp {
    case (let x, let y) where x == y:
        chk = true
    default:
        chk = false
    }
    
    return chk
    
}

func bigCheck(num1: Int, num2: Int) -> Int
{
    var big: Int = 0
    let comp:(Int, Int) = (num1,num2)
    
    
    switch comp {
    case (let x, let y) where x>y:
        big = x
    default:
        big = num2
    }
    
    return big
}

func cal2dArea(length: Int=0, width: Int = 0, radian: Int = 0, height: Int = 0, top: Int = 0) -> Double
{
    var comp: (Int, Int, Int, Int, Int) = (length, width, radian, height, top)
    var area: Double = 0
    
    switch comp {
    case (let x,0,0,0,0):
        area = Double(x * x)
    case (let x,let y,0,0,0):
        area = Double(x * y)
    case (0,0,let r,0,0):
        area = Double.pi * Double(r * r)
    case (let x,0,0,let h,0):
        area = 0.5 * Double(x*h)
    case (let x, 0, 0, let h, let t):
        area = 0.5 * Double(h * (x + t))
    default:
        area = 0
    }
    return area
}

func cal3dArea(length: Int=0, width: Int=0, height: Int=0, radian: Int=0) -> Double
{
    var comp: (Int, Int, Int, Int) = (length, width, height, radian)
    var volume: Double = 0
    
    switch comp {
    case (let x, 0, 0, 0):
        volume = Double(x*x*x)
    case (let x, let w, let h, 0):
        volume = Double(x*w*h)
    case (0, 0, let h, let r):
        volume = Double.pi*Double(r*r*h)
    case (0,0,0,let r):
        volume = Double.pi*Double(r*r*r)*Double(4)/Double(3)
    default:
        volume = 0
    }
    return volume
}

