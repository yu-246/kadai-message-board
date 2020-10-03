class MassagesController < ApplicationController
    def index
        @massages  = Massage.all
    end
    
    def show
        @massage = Massage.find(params[:id])
    end
    
    def new
        @massage = Massage.new
    end
    
    def create
        @massage = Massage.new(massage_params)
        
        if @massage.save
            flash[:success] = "Massage が正常に投稿されました"
            redirect_to @massage
        else
            flash.now[:danger] = "Massage が投稿されませんでした"
            render :new
        end
    end
    
    def edit
        @massage = Massage.find(params[:id])
    end
    
    def update
        @massage = Massage.find(params[:id])
        
        if 
            @massage.upgrade(massage_params)
            flash[:success] = "Massage は正常に更新されました"
            redirect_to @massage
        else
            flash.new[:danger] = "Massage は更新されませんでした"
            render :edit
        end
    end
    
    def destroy
        @massage = Massage.find(params[:id])
        @massage.destroy
        
        flash[:success] = "Massage は正常に削除されました"
        redirect_to massages_url
    end
    
    private
    
    # Strong Parameter
    def massage_params
        params.require(:massage).pemit(:content)
    end
end
