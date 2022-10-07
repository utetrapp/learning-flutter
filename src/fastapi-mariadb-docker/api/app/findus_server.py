from os import environ

from fastapi import FastAPI, Depends, Query, status
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from pydantic import BaseModel

from sqlalchemy import Column, Integer, String, create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.schema import FetchedValue

app = FastAPI()

SQLALCHEMY_DATABASE_URI = 'mysql://{}:{}@{}:{}/{}'.format(
        environ.get("DB_USER"), 
        environ.get("DB_PASSWORD"),
        environ.get("DB_HOST"), 
        environ.get("DB_PORT"), 
        environ.get("DB_NAME")
    )
# SQLALCHEMY_DATABASE_URI = 'mysql://public:public@localhost:3306/findus' # for quick direct test

engine = create_engine(SQLALCHEMY_DATABASE_URI)
# check if database and tables exist
# from sqlalchemy import inspect
# inspector = inspect(engine)
# print(inspector.get_table_names())


Session = sessionmaker(autocommit=False, autoflush=False, bind=engine)

db = Session()



Base = declarative_base(bind=engine)

# Entity animal
class Animal(Base):
    __tablename__ = "animal"
    __table_args__ = {"autoload": True}
    animal_id = Column(Integer, primary_key = True, nullable=False)
    name = Column(String(50), nullable=False)
    race = Column(String(50), nullable=False)
    owner = Column(String(50), nullable=False)
    image = Column(String(254), nullable=True)

# Request Body
class AnimalRequest(BaseModel):
    name: str
    rarce: str
    owner: str
    image: str


@app.get("/")
def root():
    return {"message": "Hello World"}

@app.get("/animal")
def get_animal(id: int = None, name: str = None):
    if id is not None:
        result_set = db.query(Animal).filter(Animal.animal_id == id).all()
    elif name is not None:
        result_set = db.query(Animal).filter(Animal.name == name).all()
    else:
        result_set = db.query(Animal).all()    
    response_body = jsonable_encoder({"list": result_set})
    return JSONResponse(status_code=status.HTTP_200_OK, content=response_body)

@app.post("/animal")
def create_animal(request: AnimalRequest):
    animal = Animal(
                name = request.name,
                race = request.race,
                owner = request.owner
            )
    db.add(animal)
    db.commit()
    response_body = jsonable_encoder({"animal_id" : animal.animal_id})
    return JSONResponse(status_code=status.HTTP_200_OK, content=response_body)

@app.put("/animal/{id}")
def update_animal(id: int, request: AnimalRequest):
    animal = db.query(Animal).filter(Animal.animal_id == id).first()
    if animal is None:
            return JSONResponse(status_code=status.HTTP_404_NOT_FOUND)
    animal.name = request.name
    animal.race = request.race
    animal.owner = request.owner
    animal.image = request.image
    db.commit()
    return JSONResponse(status_code=status.HTTP_200_OK)

@app.delete("/animal/{id}")
def delete_animal(id: int):
    db.query(Animal).filter(Animal.animal_id == id).delete()
    db.commit()
    return JSONResponse(status_code=status.HTTP_200_OK)
