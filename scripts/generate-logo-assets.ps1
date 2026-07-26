$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

function Add-RoundedRectangle($path, [float]$x, [float]$y, [float]$w, [float]$h, [float]$r) {
  $path.AddArc($x, $y, $r, $r, 180, 90)
  $path.AddArc($x + $w - $r, $y, $r, $r, 270, 90)
  $path.AddArc($x + $w - $r, $y + $h - $r, $r, $r, 0, 90)
  $path.AddArc($x, $y + $h - $r, $r, $r, 90, 90)
  $path.CloseFigure()
}

function New-Logo($path, [int]$size) {
  $bmp = New-Object Drawing.Bitmap $size, $size
  $g = [Drawing.Graphics]::FromImage($bmp)
  $g.SmoothingMode = [Drawing.Drawing2D.SmoothingMode]::AntiAlias

  $rect = New-Object Drawing.Rectangle 0, 0, $size, $size
  $brush = New-Object Drawing.Drawing2D.LinearGradientBrush $rect, ([Drawing.Color]::FromArgb(8, 201, 220)), ([Drawing.Color]::FromArgb(139, 37, 244)), 45
  $shape = New-Object Drawing.Drawing2D.GraphicsPath
  Add-RoundedRectangle $shape 0 0 $size $size ($size * .41)
  $g.FillPath($brush, $shape)

  $arcPen = New-Object Drawing.Pen ([Drawing.Color]::FromArgb(160, 124, 236, 255)), ($size * .028)
  $g.DrawArc($arcPen, ($size * .14), ($size * .18), ($size * .76), ($size * .68), 205, 275)

  $cardBrush = New-Object Drawing.SolidBrush ([Drawing.Color]::White)
  for ($i = 0; $i -lt 3; $i++) {
    $w = $size * .47
    $h = $size * .47
    $x = $size * (.19 + $i * .07)
    $y = $size * (.34 - $i * .055)
    $card = New-Object Drawing.Drawing2D.GraphicsPath
    Add-RoundedRectangle $card $x $y $w $h ($size * .08)
    $state = $g.Save()
    $g.TranslateTransform($x + $w / 2, $y + $h / 2)
    $g.RotateTransform((-15) + $i * 10)
    $g.TranslateTransform(-($x + $w / 2), -($y + $h / 2))
    $g.FillPath($cardBrush, $card)
    $g.Restore($state)
  }

  $atomPen = New-Object Drawing.Pen ([Drawing.Color]::FromArgb(34, 35, 184)), ($size * .025)
  $cx = $size * .50
  $cy = $size * .48
  for ($a = 0; $a -lt 180; $a += 60) {
    $state = $g.Save()
    $g.TranslateTransform($cx, $cy)
    $g.RotateTransform($a)
    $g.DrawEllipse($atomPen, -($size * .155), -($size * .055), ($size * .31), ($size * .11))
    $g.Restore($state)
  }

  $dot = New-Object Drawing.SolidBrush ([Drawing.Color]::FromArgb(34, 35, 184))
  $g.FillEllipse($dot, $cx - $size * .034, $cy - $size * .034, $size * .068, $size * .068)

  $spark = New-Object Drawing.SolidBrush ([Drawing.Color]::FromArgb(24, 191, 203))
  $points = @(
    [Drawing.PointF]::new($size * .72, $size * .27),
    [Drawing.PointF]::new($size * .745, $size * .35),
    [Drawing.PointF]::new($size * .82, $size * .375),
    [Drawing.PointF]::new($size * .745, $size * .40),
    [Drawing.PointF]::new($size * .72, $size * .48),
    [Drawing.PointF]::new($size * .695, $size * .40),
    [Drawing.PointF]::new($size * .62, $size * .375),
    [Drawing.PointF]::new($size * .695, $size * .35)
  )
  $g.FillPolygon($spark, $points)

  $g.Dispose()
  $bmp.Save($path, [Drawing.Imaging.ImageFormat]::Png)
  $bmp.Dispose()
}

New-Logo 'assets\stemdecai-logo.png' 1024
New-Logo 'assets\favicon.png' 128
