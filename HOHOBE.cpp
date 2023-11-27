// hohobe group
#include<iostream>
using namespace std;
/*
  '''
	  Program code by Liau Libetoe;

	  Program Description:
   '''
*/
float fertilizer = 0;
float moisture =0;

float fertilizer1 = 0;
float moisture1 =0;

int yield=0;

void interCroppingWin(){
	int option;
	char opt;
plant:
	cout<<"Choose plants to Intercrop: \n";
	cout<<"1.Wheat & Peas"<<endl;
	cout<<"2.Wheat & Potatoes"<<endl;
	cout<<"3.Peas & Potatoes"<<endl;
	cout<<"4.Wheat ,Peas & Potatoes"<<endl;
	cin>>option;
	if(option == 1){
		for(int i =0; i< 50; i++){
			cout<<"w";
		}
		cout<<endl;
		for(int i =0; i< 50; i++){
			cout<<"b";
		}
	    cout<<endl;
    }
	else if(option == 2){
		for(int i =0; i< 50; i++){
			cout<<"z";
		}
		cout<<endl;
		for(int i =0; i< 50; i++){
			cout<<"x";
		}
	    cout<<endl;
    }
    else if(option == 3){
		for(int i =0; i< 50; i++){
			cout<<"o";
		}
		cout<<endl;
		for(int i =0; i< 50; i++){
			cout<<"i";
		}
	    cout<<endl;
    }
    cout<<"Press y to continue or n to cancel? "<<endl;
    cin>>opt;
    if(opt == 'y'){
    	goto plant;
	}
    
}
void interCroppingSum(){
	int option;
	char opt;
plant:
	cout<<"Choose plants to Intercrop: \n";
	cout<<"1.maize & beans"<<endl;
	cout<<"2.pumpkin & sorghum"<<endl;
	cout<<"3.watermelons & groundnuts"<<endl;
	cout<<"4.watermelons ,pumpkin & beans"<<endl;
	cin>>option;
	if(option == 1){
		for(int i =0; i< 50; i++){
			cout<<"n";
		}
		cout<<endl;
		for(int i =0; i< 50; i++){
			cout<<"i";
		}
	    cout<<endl;
    }
	else if(option == 2){
		for(int i =0; i< 50; i++){
			cout<<"y";
		}
		cout<<endl;
		for(int i =0; i< 50; i++){
			cout<<"q";
		}
	    cout<<endl;
    }
    else if(option == 3){
		for(int i =0; i< 50; i++){
			cout<<"//";
		}
		cout<<endl;
		for(int i =0; i< 50; i++){
			cout<<"**";
		}
	    cout<<endl;
    }
    else if(option == 4){
		for(int i =0; i< 50; i++){
			cout<<"lil";
		}
		cout<<endl;
		for(int i =0; i< 50; i++){
			cout<<"lil";
		}
	    cout<<endl;
    }
    cout<<"Press y to continue or n to cancel? "<<endl;
    cin>>opt;
    if(opt == 'y'){
    	goto plant;
	}
    
}


void seasonalCroppingManagement(int month){
	if(month == 4 || month == 5){
		cout<<"This is the season for  planting of wheat, peas, and potatoes, with harvesting scheduled for January,March.\n";
		interCroppingWin();
		if(fertilizer == 0 ){
			cout<<"Fertilizer level is zero, manuring Needed:"<<endl;
			cout<<"Press 'y' to begin manuring: ";
			char ccin;
			cin>>ccin;
			if(ccin =='y'){
				fertilizer+=50;
			}
		}
		if(moisture == 0 ){
			cout<<"Moisture level is zero, irrigation is Needed:"<<endl;
			cout<<"Press 'y' to begin irrigation: ";
			char ccin;
			cin>>ccin;
			if(ccin =='y'){
				moisture+=50;
			}
		}
		cout<<"********************************************************************"<<endl;
		cout<<"Moisture Level: "<<moisture<<endl;
		cout<<"Manure Level: "<<fertilizer<<endl;
		cout<<"********************************************************************"<<endl;
		cout<<"Yield increase by 24% "<<endl;
	}
	else if(month == 8 || month == 9 || month == 10){
		cout<<"This is the season for maize, beans, pumpkin, sorghum, watermelons, and groundnuts, with harvesting in November-December.";
		interCroppingSum();
		if(fertilizer1 == 0 ){
			cout<<"Fertilizer level is zero, manuring Needed:"<<endl;
			cout<<"Press 'y' to begin manuring: ";
			char ccin;
			cin>>ccin;
			if(ccin =='y'){
				fertilizer1+=50;
			}
		}
		if(moisture1 == 0 ){
			cout<<"Moisture level is zero, irrigation is Needed:"<<endl;
			cout<<"Press 'y' to begin irrigation: ";
			char ccin;
			cin>>ccin;
			if(ccin =='y'){
				moisture1+=50;
			}
		}
		cout<<"********************************************************************"<<endl;
		cout<<"Moisture Level: "<<moisture1<<endl;
		cout<<"Manure Level: "<<fertilizer1<<endl;
		cout<<"********************************************************************"<<endl;
		cout<<"Yield increase by 24% "<<endl;
	}
	else{
		cout<<"No activities Here\n";
	}
}


int main(){
	int month;
    cout<<"Welcome to Machobane Farming System"<<endl;
    cout<<"Enter Month of the Year 1 - 12: ";
    cin>>month;
    seasonalCroppingManagement(month);
	return 0;
}
