# Bố cục một component chuẩn (Làm theo thứ tự)

> Tên hàm đặt hệt như bên dưới hướng dẫn.

- props:
  -- các biến
  -- các hàm

- các state, các hook (custom hook, hoặc hook của react)
- các hằng số

- các hàm onChange..., onClick..., onSelect...

  > (nói chung là on... và dựa theo cái onChange, onSelect, onDoubleClick của cái tag đó mà đặt theo.)

- các hàm handle[Check, Update, Add, Delete, Get]... (KHÔNG CÓ async)
- các hàm async handle[Check, Update, Add, Delete, Get]... (CÓ async)

- các hook lifecycle

- các hàm logic if else
- các điều kiệu if else

- render | return chính.

## Note thêm

- Component là component không được viết hàm [renderSomeThing] để hiển thị một cái component
- lưu ý khi dùng useCallbak, useMemo, memo, HOC, UseEffect

- Không được viết 2 Component lòng nhau [QUAN TRỌNG]

```jsx
// Sai
const ComponentA = () => {
  // Cấm viết thế này. (hint: tách cái ComponentB ra)
  const ComponentB = () => {};

  return "A";
};
```

## ví dụ:

```jsx
// children là một biến mặc định thì nên để đằng trước.
export const ButtonComponent = ({children, id, name, label, onClick, getCustomer}) => {
	const [state, setState] = useState();
	const [isLoading, setIsLoading] = useState(false);
	const [data, setData] = useCustomHook();

	const [loading, data, fetchGet, refetch] = useFetch({key: 'get-customer', func: getCustomer}, options);
	const [loading, data, mutateAddCustomer] = useMutate({key: 'add-customer', func: getCustomer});
	const [loading, data, mutateDeleteCustomer] = useMutate({key: 'delete-customer', func: getCustomer});
	const [loading, data, mutateUpdateCustomer] = useMutate({key: 'update-customer', func: getCustomer});

	const styles = {}

	const onClick = () => {}
	const onDoubleClick = () => {}

	const handleUpdate = () => {}
	const handleAdd = () => {}
	const handleDelete = () => {}
	const handleGet = () => {}
	const handleCheck = () => {}

	const async asyncHandleUpdate = () => {}
	const async asyncHandleAdd = () => {}
	const async asyncHandleDelete = () => {}
	const async asyncHandleGet = () => {}
	const async asyncHandleCheck = () => {}

	// theo thứ tự KHÔNG CÓ props
	useEffect(() => {
		return () => {}
	}, []);

	// theo thứ tự CÓ props
	useEffect(() => {
		console.log(state);
	}, [state]);

	const logic = () => {
		return handleCheck()
	}

	if (isLoading) return "loading...";
	if (logic) return "logic component";

	return (<button
		alt="các dữ liệu không thay đổi"
		name={name}
		style={styles}
		onClick={onClick}
		onDoubleClick={onDoubleClick}
	>
		{children}
	</button>)
}
```

- ===============================================

```jsx
export class ClassComponent extends Component {
	constructor(props) {
		super(props)

		// state
		this.state = {}

		// constants
		this.constantVariable = 'Button Text'
		this.styles = {}

		// bind functions
	}

	 onDoubleClick = () => {}

	 handleUpdate = () => {}
	 handleAdd = () => {}
	 handleDelete = () => {}
	 handleGet = () => {}
	 handleCheck = () => {}

	 async asyncHandleUpdate = () => {}
	 async asyncHandleAdd = () => {}
	 async asyncHandleDelete = () => {}
	 async asyncHandleGet = () => {}
	 async asyncHandleCheck = () => {}


	 componentDidMount() {}
	 componentDidUpdate() {}

	render() {
		const {id, name, label, onClick} = this.props;
		const logic = () => {
			return this.handleCheck()
		}

		if (isLoading) return "loading...";
		if (logic) return "logic component";

		return (<button
			alt="các dữ liệu không thay đổi"
			name={name}
			label={label}
			style={this.styles}
			onClick={onClick}
			onDoubleClick={this.onDoubleClick}
		>
			{children}
		</button>)
	}
}
```
