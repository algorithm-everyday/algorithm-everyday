function solution(new_id) {
    const functionset = [
        (arg) => { // 1
            return arg.toLowerCase();
        },
        (arg) => { // 2
            return arg.replace(/[^a-z0-9-_.]/g,'');
        },
        (arg) => { // 3
            return arg.replace(/[.]{1,}/g,'.');
        },
         (arg) => { // 4
            return arg.replace(/^[.]|[.]$/g,'');
        },
        (arg) => { // 5
            if (arg == '')
                return 'a';
            else
                return arg
        },
         (arg) => { // 6
            return arg.substring(0,15).replace(/^[.]|[.]$/g,'');

        },
         (arg) => { // 7
            while(arg.length < 3){
                arg = arg+arg.charAt(arg.length-1)
            }
            return arg;
        },
    ];
    
    let answer = new_id;
    
    functionset.forEach((func) => {
        answer = func(answer);
    });
    
    return answer;
}