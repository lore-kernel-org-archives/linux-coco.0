Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869DE181
	for <linux-coco@lists.linux.dev>; Wed, 17 Jan 2024 00:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705450082; cv=none; b=cwDXZmO72OhLoajc41AzKLEQaPzplZzzMAhrMSEm+MugDaOkqGcFUZc7mJY9DdrpXw2MqR2zHzaM4POwZiYqq3MntffOPTerXFGhKsMiY5QGvKyjENvWPUOCeyv/Jba8CDeMFia9QxqXSi6+0lVqg+riBHOK/5cXKXmUH3NE4zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705450082; c=relaxed/simple;
	bh=6upvCtqLjlcvlesxR9kBuGN9SjzKudfUSX/ZwwWZTf0=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=TFVjjufMeypnim9eZZG5t6wmUQ8OKPVXk84qAPyQHjRJpCDP1IIGA84suPsE9soheDG8jbuBQ8UpshI2X1Q63J5g5nmBJboYU8GiNY+zkagPU1cZaUG+rttvZoX2gvEKiAgVbJ83uZRnvcxCW0wyH1DYndmX5FYvbT63CvI4I3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OMroT9Ee; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OMroT9Ee"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-466de67f0d6so5776032137.1
        for <linux-coco@lists.linux.dev>; Tue, 16 Jan 2024 16:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705450080; x=1706054880; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6upvCtqLjlcvlesxR9kBuGN9SjzKudfUSX/ZwwWZTf0=;
        b=OMroT9EewVLoiE90Tqg4lVFPCJgwfeEgRh/sZAiiYTTKV2fwwfb8SBV3bl3dlKxAm8
         8vXQzSw/62OiQmRqSh+QgnCOLPjMNmKGGT0vndXYY3A7My8ZLAANTy9JNjzl2C/5bx6m
         oS0CcbVXbptJK2ONnap75lq6GEdjbgLnjGc8SEyybVJV7ARU09IrSpdam/rkFUzI3UI7
         x+rYYdq2BYgx7Bw7bL3mPgMJaRRNnbTJTnwuA5XPZO/B2ObzJqme27aApkGmDj29OEIm
         ncgi4a5G3VQO6HWX+D2+adb98Y33BL56UNaZK+IN3J5KU23ZIeVXaZkpbk69pWcGLYg5
         hp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705450080; x=1706054880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6upvCtqLjlcvlesxR9kBuGN9SjzKudfUSX/ZwwWZTf0=;
        b=A4aBDsh6YRi/Wox62dK2uG6lBwmy/YIx/QfoQD2c2767R9imItkEhI4N3GT97Th/xS
         EgM+15VV42ujVI9ofYkWRmmuftx77D+96lrX2hgerO4lTUqBEKPb4JTeSpp+B78YGZkR
         afrY2BucxQStTn2RwvW2GGLlpJC+X1W94vfaHhmZ2H5luhpJkjHzaCGWI3E+YaeyY7eQ
         DP5BJMrSqQ6z9p5okWs34Tie+yt8+Reb+a66d9ZPfHrCY5i17y8hIGV7Y65+CIN5vIYd
         polY9ot38mly66iXeQWN8hxIcHf4BpPMEsuupmoaY5Op28rNHh1VA8Zf8IOgfx3Kabex
         3ZVQ==
X-Gm-Message-State: AOJu0YyxkW5AjFCvR//XdXIttjXaE5m11boN55pLdR2OK4RnBmgx1AO1
	mt9LSiJ0SUPcJddI8STfaAKnHzk64Rn62yZJBcTlx9LgL42I
X-Google-Smtp-Source: AGHT+IHr7lzQyz9jwW6UGOICXM7ITCqnEobPRCEMvsZFRSTl5bq/rJJXAaclo9WBisLE2K4+VHiQY7WqeSLKiU9GHr0=
X-Received: by 2002:a05:6102:3134:b0:467:dfa1:3186 with SMTP id
 f20-20020a056102313400b00467dfa13186mr4450748vsh.4.1705450080348; Tue, 16 Jan
 2024 16:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZZ7YuEexYSaZYmLK@tassilo> <20240111223650.3502633-1-kevinloughlin@google.com>
 <20240115204634.GHZaWZqsVyU_fvn_RW@fat_crate.local>
In-Reply-To: <20240115204634.GHZaWZqsVyU_fvn_RW@fat_crate.local>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Tue, 16 Jan 2024 16:07:49 -0800
Message-ID: <CAGdbjm+fMBnkKDVFpf-fAEbYxTUWR0od2JzTTbEMoPVS3J_Faw@mail.gmail.com>
Subject: Re: [RFC PATCH v2] x86/sev: enforce RIP-relative accesses in early
 SEV/SME code
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Kelley <mikelley@microsoft.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Arnd Bergmann <arnd@arndb.de>, Steve Rutherford <srutherford@google.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Yuntao Wang <ytcoode@gmail.com>, 
	Wang Jinchao <wangjinchao@xfusion.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Brian Gerst <brgerst@gmail.com>, Hugh Dickins <hughd@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Joerg Roedel <jroedel@suse.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Michael Roth <michael.roth@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-coco@lists.linux.dev, 
	Ashish Kalra <ashish.kalra@amd.com>, Andi Kleen <ak@linux.intel.com>, 
	Adam Dunlap <acdunlap@google.com>, Peter Gonda <pgonda@google.com>, Jacob Xu <jacobhxu@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 12:47=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Thu, Jan 11, 2024 at 10:36:50PM +0000, Kevin Loughlin wrote:
> > SEV/SME code can execute prior to page table fixups for kernel
> > relocation. However, as with global variables accessed in
> > __startup_64(), the compiler is not required to generate RIP-relative
> > accesses for SEV/SME global variables, causing certain flavors of SEV
> > hosts and guests built with clang to crash during boot.
>
> So, about that. If I understand my gcc toolchain folks correctly:
>
> mcmodel=3Dkernel - everything fits into the high 31 bit of the address
> space
>
> -fPIE/PIC - position independent
>
> And supplied both don't make a whole lotta of sense: if you're building
> position-independent, then mcmodel=3Dkernel would be overridden by the
> first.
>
> I have no clue why clang enabled it...
>
> So, *actually* the proper fix here should be not to add this "fixed_up"
> gunk everywhere but remove mcmodel=3Dkernel from the build and simply do
> -fPIE/PIC.

I believe that the key distinction is that using mcmodel=3Dkernel (upper
2 GB of address space) or the similar mcmodel=3Dsmall (lower 2 GB) means
the compiler *can* use RIP-relative addressing for globals (because
everything is within +/- 2GB of RIP) but is not *required* to do so.
In contrast, fPIE/fPIC *requires* relative addressing but does not
necessarily require a specific 2 GB placement range. Altogether, I do
think there are use cases for both options individually. I can't think
of a reason why gcc wouldn't be able to support mcmodel=3Dkernel in
conjunction with fPIE off the top of my head, but I admittedly haven't
looked into it; I simply observed that the combination is not
currently supported.

RE: compiling the whole x86-64 kernel with fPIE/fPIC, I believe the
required changes would be very extensive (see "[PATCH RFC 00/43]
x86/pie: Make kernel image's virtual address flexible" at
https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@antgroup.c=
om/).
