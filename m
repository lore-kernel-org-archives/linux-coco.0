Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C92F38
	for <linux-coco@lists.linux.dev>; Thu,  6 Apr 2023 11:04:23 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-946a769ae5cso101054966b.1
        for <linux-coco@lists.linux.dev>; Thu, 06 Apr 2023 04:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680779062; x=1683371062;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KITffEh21kVUliy1VoMjvw87Ra13t1dF1yglnrdIiXg=;
        b=ru2NzSIpykXqu0jyhbp5qY6KqFM6yFE/mD+WKcweQ7wJdHsT9oevmpIIUVpBMhQ7/6
         ugOr37dqvNyEqA7IKCsvqJj+swUr7zD2PLuzKKbGqZFerhx4uegyuVYdJYWcpVn5Xh0X
         l0EU3cAQ9b+0Y1TLpr/SL8Q6MSKHbrdDQpycy/BTjbOg70+xB/2fRQrQoa036rsKFG+0
         DLYtHYNCnSBgBYlKOTVtWj+oppRxHhiIC/WAYzrv0yXXs3ZBphK1WIE3Mwj4wr+u4J9b
         wx2H7FBLiOhor//XyTvsf/ZGsIoaLNFlaB4g90uejobsdGtCs2uw/FesQ9c6tYcdrROH
         Vp/Q==
X-Gm-Message-State: AAQBX9fIdHC1p/M5R6NxoGHa5hmkzdfGOnafsX709vbSD8sR3dAuWKS/
	vY3I19BVjHTHCyIco9ffcWk=
X-Google-Smtp-Source: AKy350bPuWpFa8lsTNUvA8+kwvxRwcrPzqvVF0WOgFdBH+8jM2uv4ltcv5/bo9+HatYAa9uEjqf0mA==
X-Received: by 2002:aa7:de8e:0:b0:4fb:395a:6aa4 with SMTP id j14-20020aa7de8e000000b004fb395a6aa4mr4899183edv.31.1680779061830;
        Thu, 06 Apr 2023 04:04:21 -0700 (PDT)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id 23-20020a508e17000000b00501dac14d7asm617927edw.3.2023.04.06.04.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 04:04:21 -0700 (PDT)
Message-ID: <be836a4f-fc0f-bbcd-636d-4766fdd33c81@kernel.org>
Date: Thu, 6 Apr 2023 13:04:16 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Peter Zijlstra <peterz@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Dave Hansen <dave.hansen@intel.com>,
 linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshan.ljs@antgroup.com>,
 "H. Peter Anvin" <hpa@linux.intel.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Andy Lutomirski
 <luto@kernel.org>, Asit Mallick <asit.k.mallick@intel.com>,
 Cfir Cohen <cfir@google.com>, Dan Williams <dan.j.williams@intel.com>,
 David Kaplan <David.Kaplan@amd.com>, David Rientjes <rientjes@google.com>,
 Erdem Aktas <erdemaktas@google.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Joerg Roedel <joro@8bytes.org>, Juergen Gross <jgross@suse.com>,
 Kees Cook <keescook@chromium.org>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Stunes <mstunes@vmware.com>, Raj Ashok <ashok.raj@intel.com>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Tony Luck <tony.luck@intel.com>, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, x86@kernel.org
References: <20230403140605.540512-1-jiangshanlai@gmail.com>
 <19035c40-e756-6efd-1c02-b09109fb44c1@intel.com>
 <CAJhGHyBHmC=UXr88GsykO9eUeqJZp59jrCH3ngkFiCxVBW2F3g@mail.gmail.com>
 <3591487f-96ae-3ab7-6ce7-e524a070c9e7@redhat.com>
 <20230406101254.GI386572@hirez.programming.kicks-ass.net>
 <26be2c81-9431-6b43-e3e9-52d7d184750e@kernel.org>
 <20230406104750.GA392176@hirez.programming.kicks-ass.net>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [RFC PATCH 0/7] x86/entry: Atomic statck switching for IST
In-Reply-To: <20230406104750.GA392176@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06. 04. 23, 12:47, Peter Zijlstra wrote:
> On Thu, Apr 06, 2023 at 12:35:24PM +0200, Jiri Slaby wrote:
>> On 06. 04. 23, 12:12, Peter Zijlstra wrote:
>>> On Tue, Apr 04, 2023 at 07:03:45PM +0200, Paolo Bonzini wrote:
>>>> On 4/4/23 05:17, Lai Jiangshan wrote:
>>>>> The cover letter has 800+ lines of comments.  About 100-300 lines
>>>>> of comments will be moved into the code which would make the diffstat
>>>>> not so appealing.
>>>>
>>>> Removing assembly from arch/x86/entry/ and adding English to Documentation/?
>>>> That's _even more_ appealing. :)
>>>
>>> I *much* prefer in-code comments to random gibberish that's instantly
>>> out of date squirreled away somewhere in an unreadable format in
>>> Documentation/
>>
>> +1 as one can link comments in the code to Documentation easily nowadays.
>> They are sourced and end up in the generated Documentation [1] then. One
>> only needs to type the kernel-doc properly.
> 
> Urgh, so that kernel doc stuff can defeat its purpose too. Some of that
> is so heavily formatted it is unreadable gibberish just like
> Documentation/ :/

Definitely it _can_ defeat the purpose and be heavily formatted.But it 
doesn't have to. It's like programming in perl.

What I had in mind was e.g. "DOC: TTY Struct Flags":
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/tty.h#n261

Resulting in:
https://www.kernel.org/doc/html/latest/driver-api/tty/tty_struct.html#tty-struct-flags

Both the source and the result are quite readable, IMO. And the markup 
in the source is not mandatory, it's only for emphasizing and hyperlinks.

As I wrote, you can link the comment in the code. But definitely you 
don't have to, if you don't want. I like the linking in Documentation as 
I can put the pieces from various sources/headers together to one place 
and build a bigger picture.

> I really detest that whole RST thing, and my solution is to explicitly
> not write kerneldoc, that way the doc generation stuff doesn't complain
> and I don't get random drive by patches wrecking the perfectly readable
> comment.

Sure. Rst _sources_ are not readable, IMO. Only generated man pages or 
html are.

thanks,
-- 
js

