module Api
    module V1
        class ArticulosController < ApplicationController
            
            def index
                articulos = Articulo.order('created_at ASC')
                render json: {
                    status: 'SUCCESS',
                    message: 'artículos cargados',
                    data: articulos
                }, status: :ok
            end

            def show
                articulo = Articulo.find(params[:id])
                render json: {
                    status: 'SUCCESS',
                    message: 'artículo cargado',
                    data: articulo
                }, status: :ok
            end

            def create
                articulo = Articulo.new(articulo_params)
                
                if articulo.save
                    render json: {
                        status: 'SUCCESS',
                        message: 'artículo guardado',
                        data: articulo
                    }, status: :ok
                else
                    render json: {
                        status: 'ERROR',
                        message: 'artículo no guardado',
                        data: articulo.errors
                    }, status: :unprocessable_entity
                end
                
            end

            def destroy
                articulo = Articulo.find(params[:id])
                articulo.destroy
                render json: {
                    status: 'SUCCESS',
                    message: 'artículo borrado',
                    data: articulo
                }, status: :ok
            end

            def update
                articulo = Articulo.find(params[:id])
                if articulo.update(articulo_params)
                    render json: {
                        status: 'SUCCESS',
                        message: 'artículo actualizado',
                        data: articulo
                    }, status: :ok
                else
                    render json: {
                        status: 'ERROR',
                        message: 'artículo no actualizado',
                        data: articulo.errors
                    }, status: :unprocessable_entity
                end
                
            end
            
            private

            def articulo_params
                params.permit(:titulo, :contenido)
            end
            
            
        end
    end
end