Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D92D186D
	for <linux-coco@lists.linux.dev>; Tue, 19 Jul 2022 20:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B41C341D3
	for <linux-coco@lists.linux.dev>; Tue, 19 Jul 2022 20:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658263518;
	bh=is8+ILmv9PejEMf4YjQ/EARYt+ria3kqCNvGVtOmbyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EowHTKcabU5Y6iY9imocdt412ApdERqmzizE+EI4KudFJguFmk+GRKrJhurPVeI8Z
	 nSMF39slLkIxdhwyrPXu/UpTO89iu74EMBbzaxDO2v5U3T2Pb9mqjfE4A0rVmO2qoP
	 vdknq1ifx1jSFjAMBmeepNuGo+6slBs9WtmwqFEcIjuu0WPMImNZjNDLhvir24LDTW
	 AmW93T2YxdJCuDHNGDUeKh8XdTUfGQxc6igy9M5o5dIEBTFPB1X9iWyRvY+OzIZs/u
	 8U/+RYkwFJc+Opl5SL12tfpCzdRgDP/mdKMEu3Bk059Tz7wIDMus7l46G5BUrmGbRz
	 z+sDng4OgPnhA==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-10d83692d5aso46430fac.1
        for <linux-coco@lists.linux.dev>; Tue, 19 Jul 2022 13:45:18 -0700 (PDT)
X-Gm-Message-State: AJIora8zaIGX31xr97T5eFjEsRsOIUn3hoKz8wr/PdC4ePLMC7B3eKrJ
	rojPkEGWTnDdkWPHkQ7JCw7V6LmALnZcc2I8rX8=
X-Google-Smtp-Source: AGRyM1sICwjAXSPoZhvHV3Kl2TfNBu9m6a+FLzUR2NSmzL9dkb7rG0rM0A03qKW8n7Vjdtf9rfc5bQfPyzgPrD82OAc=
X-Received: by 2002:a05:6870:5b91:b0:108:374a:96b0 with SMTP id
 em17-20020a0568705b9100b00108374a96b0mr766142oab.126.1658263517968; Tue, 19
 Jul 2022 13:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMj1kXHD5XBAS1aBjzg1RCeK6qgtanUSED_xyTZ0v1j+UShMKw@mail.gmail.com>
 <20220627122230.7eetepoufd5w3lxd@black.fi.intel.com> <CAMkAt6oJJaRM_dy=y2BP99VziPriVuA4jAmMc=G7njwJYKFgyg@mail.gmail.com>
 <CAMj1kXHpS2B9Q7AaQ1euGidZUEyR6gfi=e+t1J_Cr8bmK_9mTw@mail.gmail.com>
 <20220627223808.ihgy3epdx6ofll43@black.fi.intel.com> <CAMj1kXEdS9SzFZZ4WGH6sR0WDCOgYDZ3Geg6X2sqSnQ-CXXpZA@mail.gmail.com>
 <20220718172159.4vwjzrfthelovcty@black.fi.intel.com> <CAAH4kHYR+VkSJ5J8eWmeaEvstuRz_EuqVQqPfwmp5dhNGRyJwQ@mail.gmail.com>
 <CAAH4kHaHJo4NUb72tHeica4a34hq5u_QP6d6Vuzngf6EqTJ8Aw@mail.gmail.com>
 <CAAH4kHaB2tL+sAn0NAciu5DQeX5hpNkDees=n=f83S=Ph9Y6tw@mail.gmail.com> <YtcCWfCQuEsVhH6W@zn.tnic>
In-Reply-To: <YtcCWfCQuEsVhH6W@zn.tnic>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 19 Jul 2022 22:45:06 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEKtcieycyyFMyuLKJK61FgaDwtLieC0N47W1Sa5LaBsA@mail.gmail.com>
Message-ID: <CAMj1kXEKtcieycyyFMyuLKJK61FgaDwtLieC0N47W1Sa5LaBsA@mail.gmail.com>
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted memory
To: Borislav Petkov <bp@alien8.de>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Peter Gonda <pgonda@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, 
	Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Dave Hansen <dave.hansen@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Marcelo Cerri <marcelo.cerri@canonical.com>, tim.gardner@canonical.com, 
	Khalid ElMously <khalid.elmously@canonical.com>, philip.cox@canonical.com, 
	"the arch/x86 maintainers" <x86@kernel.org>, Linux Memory Management List <linux-mm@kvack.org>, linux-coco@lists.linux.dev, 
	linux-efi <linux-efi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"Yao, Jiewen" <jiewen.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Jul 2022 at 21:14, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, Jul 19, 2022 at 11:29:32AM -0700, Dionna Amalie Glaze wrote:
> > How about instead of the limited resource of UTS_VERSION, we add a
> > SETUP_BOOT_FEATURES enum for setup_data in the boot header? That would
> > be easier to parse out and more extensible in the future.
> > https://www.kernel.org/doc/html/latest/x86/boot.html?highlight=boot
> >
> > This can contain a bitmap of a number of features that we currently
> > need manual tagging for, such as SEV guest support, SEV-SNP guest
> > support, TDX guest support, and (CONFIG_UNACCEPTED_MEMORY, TDX) or
> > (CONFIG_UNACCEPTED_MEMORY, SEV-SNP).
> > The VMM, UEFI, or boot loader can read these from the images/kernels
> > and have the appropriate behavior.
>
> I think for stuff like that you want loadflags or xloadflags in the
> setup header.
>

Please, no. Let's not invent Linux/x86 specific hacks to infer whether
or not the kernel is capable of accepting memory when it is perfectly
capable of telling us directly. We will surely need something
analogous on other architectures in the future as well, so the setup
header is definitely not the right place for this.

The 'bootloader that calls EBS()' case does not apply to Linux, and
given that we are talking specifically about confidential computing
VMs here, we can afford to be normative and define something generic
that works well for us.

So let's define a way for the EFI stub to signal to the firmware
(before EBS()) that it will take control of accepting memory. The
'bootloader that calls EBS()' case can invent something along the
lines of what has been proposed in this thread to infer the
capabilities of the kernel (and decide what to signal to the
firmware). But we have no need for this additional complexity on
Linux.
