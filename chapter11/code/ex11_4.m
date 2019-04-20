afm=imread('rice.png'); 

figure,imshow(afm); 

se = strel ('disk', 15) ; 
Itop = imtophat (afm , se) ; 
figure , imshow( Itop , [ ]) , title ( 'top - hat image');

Ibot = imbothat (afm , se) ;  
figure , imshow( Ibot , [ ]) , title ('bottom - hat image');

Ienhance = imsubtract (imadd ( Itop , afm) , Ibot) ;  
figure , imshow( Ienhance) , title ('original + top - hat - bottom - hat');

Iec = imcomplement ( Ienhance) ; 
figure , imshow( Iec) , title ('complement of enhanced image'); 

Iemin = imextendedmin( Iec , 22) ;  
figure , imshow( Iemin) , title ('extended minima image¡¯');

Iimpose = imimposemin ( Iec , Iemin) ;  
figure , imshow( Iimpose) , title ( 'imposed minima image');  

BW = watershed(Iimpose); 
imshow(BW);  
