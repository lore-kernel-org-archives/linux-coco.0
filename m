Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2084173
	for <linux-coco@lists.linux.dev>; Tue, 11 Jan 2022 09:00:00 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id h20-20020a9d6f94000000b0059100e01744so940888otq.4
        for <linux-coco@lists.linux.dev>; Tue, 11 Jan 2022 01:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bpi5yDslZk96fGP0AiL8cVK6M5zVjolT/YXQK+TShT4=;
        b=eFUOEGUfVwr+KA/dAq1Chz/htbufTyGyC7BwTd95/DvX090ijtoqnldGYGbSLkuQXR
         oKJNgV4K47rMHkjMou5rvfrMuJuzjDE5uQezF+MDd7CDjmcIaU2JdeJ73owOQgvs86R3
         ftz0GuTOdgUMqpVHms2F0Pnaiwy3byXKNnCACETNPdd+k2I9idlRXH91q3y67mRS6jeW
         9JQEOTxitLAtNw2x2X1JUjZdv0GhshpHr47QX3jyb00sv/kvKQT/Z3RAGtjJ44lJ4dyv
         BUIm1uUaV3u102hBloRdhg0b1QztiPlefiyGVOGhoMztdTG3JyhCCMd68lHZrDsBTG16
         eNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bpi5yDslZk96fGP0AiL8cVK6M5zVjolT/YXQK+TShT4=;
        b=H5I4OQPxJz0/XNmIq0UGc/AusewgH1vnmq7yR0zOvXOopq+YEqJAFO6XNOfvsVhMiP
         9Xd0iyC/IdKGqN4fWnO1wT9ZY0ZdYKBGEewe9QVScptcLOwe6cGbXWxSo+BFpFXMivXg
         GVWgwsMxQvyzniwYM++JGf+twRfWerzTAdU0mgpLAhwEC/dzU7oQRzfHIrgyx/Nz70Mu
         8fDXvj1jJAX7J4v4zT13/Nsi9CXNOssW9ShEStfCsbdc7UGNnXte3ohpmyD+DJZSLSpw
         56OJcx5FlhKKqeGB2qDZ+U3Ic0pYsQ3g8Tb75YwGU6hFdAxEeCygzjM4Eoa+wbVPyHOm
         QgbA==
X-Gm-Message-State: AOAM532xAEwgGXYfskwR1BFXxiMYxttE05OjFt8bLbsBuZ2huLumk+47
	MqXCDQpkCG2HUt7A7+IRsIUuz2Zn/YJ1gn9s5Pc=
X-Google-Smtp-Source: ABdhPJxBtMctMZ2FSy/SM0hSNvXMghYRzhYObXWQyWPEWXbR2jnbEHYpfydwBbZo6+51vTDmuc3Po1sBuk5I6P4MSkc=
X-Received: by 2002:a9d:5190:: with SMTP id y16mr2674164otg.189.1641891599946;
 Tue, 11 Jan 2022 00:59:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211210154332.11526-1-brijesh.singh@amd.com> <20211210154332.11526-25-brijesh.singh@amd.com>
 <cd8f3190-75b3-1fd5-000a-370e6c53f766@intel.com> <20211213154753.nkkxk6w25tdnagwt@amd.com>
In-Reply-To: <20211213154753.nkkxk6w25tdnagwt@amd.com>
From: Chao Fan <fanchao.njupt@gmail.com>
Date: Tue, 11 Jan 2022 16:59:49 +0800
Message-ID: <CAEdG=2VOcMkyRdDRy=L6NJ1728n_jUYWv_W6Y0-GaHStgGfsLw@mail.gmail.com>
Subject: Re: [PATCH v8 24/40] x86/compressed/acpi: move EFI system table
 lookup to helper
To: Michael Roth <michael.roth@amd.com>
Cc: Dave Hansen <dave.hansen@intel.com>, fanc.fnst@cn.fujitsu.com, j-nomura@ce.jp.nec.com, 
	bp@suse.de, Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, 
	Peter Gonda <pgonda@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Vlastimil Babka <vbabka@suse.cz>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, 
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, tony.luck@intel.com, marcorr@google.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I am this Chao Fan, and <fanc.fnst@cn.fujitsu.com> won't be used again.
Please add me with fanchao.njupt@gmail.com
Many thanks.

Thanks,
Chao Fan

Michael Roth <michael.roth@amd.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=8814=E6=
=97=A5=E5=91=A8=E4=BA=8C 11:46=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Dec 10, 2021 at 10:54:35AM -0800, Dave Hansen wrote:
> > On 12/10/21 7:43 AM, Brijesh Singh wrote:
> > > +/*
> > > + * Helpers for early access to EFI configuration table
> > > + *
> > > + * Copyright (C) 2021 Advanced Micro Devices, Inc.
> > > + *
> > > + * Author: Michael Roth <michael.roth@amd.com>
> > > + */
> >
> > It doesn't seem quite right to slap this copyright on a file that's ful=
l
> > of content that came from other files.  It would be one thing if
> > arch/x86/boot/compressed/acpi.c had this banner in it already.  Also, a
>
> Yah, acpi.c didn't have any copyright banner so I used my 'default'
> template for new files here to cover any additions, but that does give
> a misleading impression.
>
> I'm not sure how this is normally addressed, but I'm planning on just
> continuing the acpi.c tradition of *not* adding copyright notices for new
> code, and simply document that the contents of the file are mostly moveme=
nt
> from acpi.c
>
> > arch/x86/boot/compressed/acpi.c had this banner in it already.  Also, a
> > bunch of the lines in this file seem to come from:
> >
> >       commit 33f0df8d843deb9ec24116dcd79a40ca0ea8e8a9
> >       Author: Chao Fan <fanc.fnst@cn.fujitsu.com>
> >       Date:   Wed Jan 23 19:08:46 2019 +0800
>
> AFAICT the full author list for the changes in question are, in
> alphabetical order:
>
>   Chao Fan <fanc.fnst@cn.fujitsu.com>
>   Junichi Nomura <j-nomura@ce.jp.nec.com>
>   Borislav Petkov <bp@suse.de>
>
> Chao, Junichi, Borislav,
>
> If you would like to be listed as an author in efi.c (which is mainly jus=
t a
> movement of EFI config table parsing code from acpi.c into re-usable help=
er
> functions in efi.c), please let me know and I'll add you.
>
> Otherwise, I'll plan on adopting the acpi.c precedent for this as well, w=
hich
> is to not list individual authors, since it doesn't seem right to add Aut=
hor
> fields retroactively without their permission.
