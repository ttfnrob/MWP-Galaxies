mod = []
File.open('spectra.dat').each do |line|
  mod << line.split(' ')
end

# puts mod[166][0]

gal = {}
File.open('gals.dat').each do |line|
  d = line.split(' ')
  gal[d[0]] = {} unless gal.include?(d[0])
  gal[d[0]]['lon'] = d[1]
  gal[d[0]]['lat'] = d[2]
end 

File.open('gals.dat').each do |line|
  d = line.split(' ')
  gal[d[0]][d[3]] = d[5].to_f
end 

output = "galaxy, GLAT, GLON1, GLON2, z\n"
gal.each do |g|
  fits = []
  avgs = []
  mags = []
  vals = []
  num = (1..64).to_a
  num.each do |n|
    
    i1 = g[1]['3.6'] - mod[38][n].to_f
    i2 = g[1]['4.5'] - mod[62][n].to_f
    i3 = g[1]['5.8'] - mod[87][n].to_f
    i4 = g[1]['8'] - mod[100][n].to_f
    i5 = g[1]['24'] - mod[176][n].to_f
    
    # puts i1, i2, i3, i4, i5
    avg = (i1+i2+i3+i4+i5)/5.0
    avgs << (i1+i2)/2.0
    mags << (-2.5*Math.log10(280.9/10**i1) + -2.5*Math.log10(179.7/10**i2))/2.0
    vals << (-2.5*Math.log10(280.9/10**g[1]['3.6']) + -2.5*Math.log10(179.7/10**g[1]['4.5']))/2.0
    fits << ((i1-avg)**2 + (i2-avg)**2 + (i3-avg)**2 + (i4-avg)**2 + (i5-avg)**2)
    
  end
  best = fits.rindex(fits.min)
  mag = mags[best]
  puts "Galaxy #{g[0]} is best fit by model #{best+1} with extinction of #{avgs[best]} vFv or #{mag} mag"
  
  zrange = (1..2000).to_a
  fs = []
  zs = []
  zrange.each do |zb|
    z = zb/1000.0
    zs << z
    fit = -24 - (vals[best]-5*Math.log10((6000*((1+z)-Math.sqrt(1+z)))/10))-mag-(-6*Math.log10(1+z)) 
    fs << fit**2
    puts fit
  end
  best_fit = fs.rindex(fs.min)
  best_z = zs[best_fit]
  g[1]['lon'].to_f>180 ? glon2=g[1]['lon'].to_f-360 : glon2=g[1]['lon'].to_f
  output << "#{g[0]}, #{g[1]['lat']}, #{g[1]['lon']},  #{glon2}, #{best_z}\n"
end    
File.open('gals_z.csv', 'w') {|f| f.write(output) }