Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBC1168
	for <linux-coco@lists.linux.dev>; Thu, 22 Jul 2021 17:31:40 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id r17so4746952qtp.5
        for <linux-coco@lists.linux.dev>; Thu, 22 Jul 2021 10:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lmKN41ZlX4yC+pRjkhPFTz8I4eLfisxJp0th04qeWoE=;
        b=Bsx0A3a2hSEfKbHrLvURxTJdWaUlcLsubMHg1rcRtr381codtyK879fqK0fYC+uj3a
         51VVMesdzai2m0l5tUcwfLdkSsWJumposeoAQ1Gcjl/UgSTdsMaJK1et0ySew/FwusqJ
         FjwJUvwGL2Ppk6bMizOrCHzsy3hwxcXjqrT3986iqVDSL5pBJukHRTrZFZuhMIEDZ4us
         AUqyX+9KsTZ/zfG0VQBbYqTl9H9+dsBp3dZPe84qbEbeT6m03K8e0hWwaTVcaczIa/Za
         dtfhyI1gOHbOnaMGg/M1Bs4WhqIpbNCsJ/SojV10rHy7EODuVaq/fWuxjtWI3/djMJ0B
         ZFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lmKN41ZlX4yC+pRjkhPFTz8I4eLfisxJp0th04qeWoE=;
        b=d9viT5vrE7DWeY5eAwuqssoFTiUVupDLTY6uyOUq6qU5pkaYaEVjKffN739nBfyNWO
         S+6HVE666ZDB25UbX4qEi6b1+5P2RAAXMIOb28+Rzw48Ut9emcp+IPkiBb7qg4zwnlX/
         QOb53WZ8g9C1GphwtsZLPBuwSemVq22BsdH+9MHiQQiFBpqxhHdq+YXptiUE9nuIRumN
         1+RD/ReVR35mcHP+iQr/FEwBoJt+PKoXBHnirNmaDzrx5lFt98JGwa4C5j+fM2xwZ68l
         tTdcCpJmGVy/1pw3HD/Uh6D83VTJIYlfRuVl790mXXUAa3hoj6r5zBKUT0N5Z9hMj7KZ
         PjwA==
X-Gm-Message-State: AOAM533II3bnBqv+kg2oqRvxy9H/kG3o+US73ibnP3i48W7hi1Iiw7na
	PwpPwcmwB5maQP7g9YADgAnS8Qah8TukL1BxQPENTg==
X-Google-Smtp-Source: ABdhPJyqSn0RXww7pFw94yXrC6xAH7Xwkqei1MhLDJEtFuqLHYRonMkFw82kbNxsonV7Y8nZfkpm0y3fTswg5Yyv4rk=
X-Received: by 2002:a05:622a:1907:: with SMTP id w7mr657809qtc.251.1626975098778;
 Thu, 22 Jul 2021 10:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YPV27hDPZUoVsIZt@suse.de> <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com> <aa564856-36c7-ae19-7a82-17638cdf5ec1@linux.intel.com>
In-Reply-To: <aa564856-36c7-ae19-7a82-17638cdf5ec1@linux.intel.com>
From: Marc Orr <marcorr@google.com>
Date: Thu, 22 Jul 2021 10:31:27 -0700
Message-ID: <CAA03e5EDGdD05+PQsfv+b3ce_4SaMrmXsVGq292D2Gxjs6Xr8A@mail.gmail.com>
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
To: Andi Kleen <ak@linux.intel.com>
Cc: Erdem Aktas <erdemaktas@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Joerg Roedel <jroedel@suse.de>, David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kaplan, David" <David.Kaplan@amd.com>, 
	Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>, x86 <x86@kernel.org>, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 10:17 PM Andi Kleen <ak@linux.intel.com> wrote:
>
>
> On 7/19/2021 6:51 PM, Erdem Aktas wrote:
> >
> > > There's one exception to this, which is the previous memory view in
> > > crash kernels. But that's an relatively obscure case and there might be
> > > other solutions for this.
> >
> > I think this is an important angle. It might cause reliability issues.
> > if kexec kernel does not know which page is shared or private, it can
> > use a previously shared page as a code page which will not work. It is
> > also a security concern. Hosts can always cause crashes which forces
> > guests to do kexec for crash dump. If the kexec kernel does not know
> > which pages are validated before, it might be compromised with page
> > replay attacks.
>
> First I suspect for crash it's not a real security problem if a
> malicious hypervisor would inject zeroed pages. That means actual strong
> checks against revalidation/reaccept are not needed. That still leaves
> the issue of triggering an exception when the memory is not there. TDX
> has an option to trigger a #VE in this case, but we will actually force
> disable it to avoid #VE in the system call gap. But the standard crash
> dump tools already know how to parse mem_map to distinguish different
> types of pages. So they already would be able to do that. We just need
> some kind of safety mechanism to prevent any crashes, but that should be
> doable. Actually I'm not sure they're really needed because that's a
> root operation.

I'm not as familiar with TDX as SNP. So I'm not sure that I follow the
exact security threat that Erdem was alluding to. That being said, I
do want to chime in with the following: I think we should not assume
that the guest getting into a certain state is "probably" not a real
security issue. IMHO, we need to be completely certain that guest data
cannot be compromised if we're going to remove the requirement that
guest memory only be validated once in a certain state (e.g., from
within a crash kernel). Perhaps it is the case that we're certain that
guest data cannot be compromised from within a crash kernel -- but
it's not what I read in the email exchange.
