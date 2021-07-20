Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256D770
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 23:55:34 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d1so95807plg.0
        for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 16:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IXcGXToWT10UKWVclTGI7q58rijOYbFmi2XC+SXJau4=;
        b=A1T7Ipcw3R7CzHvcKxWTBUQ4KZaOw7wGWIKUBhTqzCe/n+KP7tKiRpyrxXXDMYvqtr
         K254VImoZDO+ikZaxhWPHlD1pEl7jTu47XDr3OM3KGDhv9WJwPddiBynCDlIGkNBIBX4
         8tsVWqZ6G93FTCVBGU8+FraoHbYSH13zEarZzpANRdG07oSZm9eCiIht4vmwqtKr8u94
         yocqNBkVOe5ecqf5jjZPFnxdn8FBB4Y4Bw0IZEkmOsI5YI7FHk7HBv68Dn5t7HHV0vjJ
         usvsO3ndxL98DkFWq03VJwey4UZ3ChFFSZA9ACmKE/lkwgjdj8OAYyz77D5h1KAUlfQJ
         2gHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IXcGXToWT10UKWVclTGI7q58rijOYbFmi2XC+SXJau4=;
        b=WFdxgc5nlyPKz7EotOBRCUMlGD8tHYL7DhMYlsY7nruXHxf8qszt+fdfQcfee3DfVo
         WpGF/AwRUXVO3JprRUGSDmJkMObGCHpF5IYlITmacdJcmB4QIbrtUQv3ZvQNrGSOUmJx
         Lm5xl1Nxcfd0GLs+ClNI+72FenRanSllIjs0Xjmn6/ZL6zdBVFrOAzKOwkottqquqZj1
         aLcUQPwq9eaQvoFAiNoMJpBAiR2kZuebSW2DDuV9+VcGFvyInxRo7YTtNJOr91/VHQzh
         WOqz7Fw/EhPDcDB97W6pfWGHLM3RUA9/KPkwevc4YLYgHhW5XW4jmfcoRz+o/bVNc2yX
         /3Qg==
X-Gm-Message-State: AOAM5300TXlOxo9y6ByGXhZFYWACn4BfkcAkqdiGr0EtKg1NTH/L7sPl
	PzUQ+ILB8jWr0ho3oTBY7m5KHBT5xTWsxU7kow6ZXg==
X-Google-Smtp-Source: ABdhPJzMCA7LDHQzcd/ECYAv9xe7H5wwk1dWWZmjUNxFOvyQrp9acw3qrwL7JLWdwZC+AMInGFN0H49CiRBv6QTCR/U=
X-Received: by 2002:a17:902:ed95:b029:ee:aa46:547a with SMTP id
 e21-20020a170902ed95b02900eeaa46547amr25626237plj.27.1626825333285; Tue, 20
 Jul 2021 16:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YPV27hDPZUoVsIZt@suse.de> <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com>
 <eacb9c1f-2c61-4a7f-b5a3-7bf579e6cbf6@www.fastmail.com> <CAAYXXYzDheR6C19Q01w267CfgW6DnZ-Hurscm-=OVATwb4dy4Q@mail.gmail.com>
 <20210720220113.GA535804@tassilo.jf.intel.com>
In-Reply-To: <20210720220113.GA535804@tassilo.jf.intel.com>
From: Erdem Aktas <erdemaktas@google.com>
Date: Tue, 20 Jul 2021 16:55:22 -0700
Message-ID: <CAAYXXYwbt4_FcM1=3PRgiacfdFoztwt53CAukBaW61EyGeecnQ@mail.gmail.com>
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
To: Andi Kleen <ak@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Joerg Roedel <jroedel@suse.de>, 
	David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kaplan, David" <David.Kaplan@amd.com>, 
	Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thank you so much for your answer and sorry for keeping the discussion long.

On Tue, Jul 20, 2021 at 3:01 PM Andi Kleen <ak@linux.intel.com> wrote:
> You mean when the TDVF is changed? In this case the unaccepted memory
> will be a different memory type, so not lazy accept enabled kernels wouldn't
> use it.

Thanks Andi for the clarification. I also saw the Kirill's answer. It
makes sense.

> But for the kexec crash case it would be just attacks against the crash
> dump, which I assume are not a real security concern.

If the crash kernel is compromised, it can be used to dump the
customer memory content  to a shared location which is a real security
concern, is it not?

> The crash kexec
> mostly runs in its own memory, which doesn't need this, or is small
> enough that it can be fully pre-accepted. And for the previous memory
> view probably these issues are acceptable.

I think this is where I am getting confused. I agree that we can copy
the crashkernel to its own memory (all accepted) and run it. My
confusion is: crash kernel will dump the memory which might have some
shared pages between. we have 3 options:
1- We can either accept all the pages again, that includes the shared
pages and lose the content of it. If we do not care about the content
in shared pages, then this is okay.
2- Have a mechanism to transfer the private/shared page mapping and
map all the pages accordingly before dumping.
3- Have a #VE handler and to accept the pages on the flight or
identify if it is a shared page based on EPT-violation #VE
information.

I am not sure what crash kernel can do when it accesses a previously
shared page (no SEPT entry) as private with the lack of one of the
above options or similar one.

>
> We actually plan to disable those #VEs, to avoid any problems with
> the system call gap. Instead the plan is that the kernel will know
> in advance what memory has been accepted or not, and accept it before
> touching.

Make sense. Thanks Andi.

-Erdem
