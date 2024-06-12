package data

type RepositoryInterface interface {
	Save()
}

type Repository struct {
}

func GetProvider() RepositoryInterface {
	return &Repository{}
}

func (r Repository) Save() {

}
