Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559A46AF
	for <linux-coco@lists.linux.dev>; Tue,  9 Aug 2022 21:09:25 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id i62so20330167yba.5
        for <linux-coco@lists.linux.dev>; Tue, 09 Aug 2022 14:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=4AnOLC3meWulFDlunnxqr8ro1/97TD7nuiX27zsgi3w=;
        b=NsJ2BZTYrfxq6UgoEZX7cFaurvwf57FlPR++8OifPr2sNTUZQ5ptP/BMu38FsOwGjw
         lRPwqjEF2FELM29RAO6PCR2PGj9SE2siJGQvqUMCV1ySeEEnMmbMX9X95vPwVEMns8ea
         fCE3B7DkUIaaLPQlhs7KKL9mAxtsRgr2K21uJuNxiI6N3R+vgxM9mRXchkJiSToKafDO
         /X8fwRmEqel5qz/q/ln06VGZZLzsUCiFAC7rFg94E+7DM0VUc6Odfcy/QHblavevj7Bz
         Rf4ForjNKA2m3+Y2uIa+2Knapldn44WxYqdaRYAb6JNt1ETCRs7LKorphFBb+FbGIGHq
         0O/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4AnOLC3meWulFDlunnxqr8ro1/97TD7nuiX27zsgi3w=;
        b=gvEGkYlx/gYEFJQbjMZ3sNIgqsE/FSn3OU2zKuLj2gSqT9Yr1uwOLc4T8IiguWgtih
         U+6qkKEzgBrs9I9W1vhl+lUqLbfssAlnOat9Sud4wV8IRAFcjhmK9oj35Sb8dz5iDek7
         3fccd1Xfmu+/7Bc7MMxv7rNYvyXzUyX6C8Wg5zN84K9GJTdZsyrjqgsdFcqxGqhuMAU7
         UFx+HzsnQi/pXq9IgtrGM22DBUxCFvAJ5la74nC5ax2iEWsQpJ3AxbUFZ3D686grny8y
         E2jPofFE+UHi1nUmEvQkxUXLm8JsHvCJh2pZkR+ULL+bXfVRdfTzm0dalS4VDImSFUdk
         N2HQ==
X-Gm-Message-State: ACgBeo13L95PUkzHgVHGmAoGojSdsDCPDzBdanxBPNib0nVe8mFhLG4y
	aMPDjy3/ZkcKWaTbIklAWoeLX+rVUv0asS8vOCzbUg==
X-Google-Smtp-Source: AA6agR4c14r85y/vAuWCM7cekVD5gahj8uuXMIUH2AxcX3QY04lGwJ8N8fHdMcgi3pCAM3B8RV9vPYU7J/SICBLs4SM=
X-Received: by 2002:a25:fb06:0:b0:677:5a84:9f61 with SMTP id
 j6-20020a25fb06000000b006775a849f61mr20527053ybe.560.1660079364031; Tue, 09
 Aug 2022 14:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMj1kXEKtcieycyyFMyuLKJK61FgaDwtLieC0N47W1Sa5LaBsA@mail.gmail.com>
 <YtcgxxMyFTReuuRw@zn.tnic> <bb7479df-7871-9861-600d-c2fed783b659@intel.com>
 <YtcnQbiRgZPtR+rQ@zn.tnic> <22d54786-bc12-ecc5-2b37-cbaa56090aa8@intel.com>
 <CAA03e5FMEyswDhoXRJ5U_n9RG4QM524aQYpF4473ydnAVJr1PA@mail.gmail.com>
 <ffb4ae72-7fd4-d2a0-df10-3969cf8ca07f@intel.com> <CAMj1kXHEc=vEt=CtfdiPEsUe2i8QogAi+jvtY6h1awo7GZ-nRg@mail.gmail.com>
 <20220809111436.kudwg2nprnnsfvuh@box.shutemov.name> <CAMj1kXE67H_cgYbufUxQ7HXg929dFopWH+cKX5ijAdePP8Zt-g@mail.gmail.com>
 <20220809115427.bmkbap434oupinq2@box.shutemov.name>
In-Reply-To: <20220809115427.bmkbap434oupinq2@box.shutemov.name>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 9 Aug 2022 14:09:12 -0700
Message-ID: <CAAH4kHYhK=4+bz2oQZTzJg=WNkce6BY8Wcw=yf0_Yy+U+-kcBQ@mail.gmail.com>
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted memory
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Marc Orr <marcorr@google.com>, Borislav Petkov <bp@alien8.de>, Peter Gonda <pgonda@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, 
	Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Marcelo Cerri <marcelo.cerri@canonical.com>, 
	tim.gardner@canonical.com, Khalid ElMously <khalid.elmously@canonical.com>, 
	philip.cox@canonical.com, "the arch/x86 maintainers" <x86@kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-coco@lists.linux.dev, 
	linux-efi <linux-efi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"Yao, Jiewen" <jiewen.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"

> > > > EFI is basically our existing embodiment of this fw/kernel negotiation
> > > > thing, and iff we need it, I have no objection to using it for this
> > > > purpose, i.e., to allow the firmware to infer whether or not it should
> > > > accept all available memory on behalf of the OS before exiting boot
> > > > services. But if we don't need this, even better.
> > >
> > > FW/kernel negotiation does not work if there's a boot loader in the middle
> > > that does ExitBootServices(). By the time kernel can announce if it
> > > supports unaccepted memory there's nobody to announce to.
> > >
> >
> > Why would you want to support such bootloaders for TDX anyway? TDX
> > heavily relies on measured boot abstractions and other things that are
> > heavily tied to firmware.
>
> I don't understand it either. And, yet, there's demand for it.
>

I think there's no good solution for this bad upgrade path that the
UEFI spec stuck us with, so I think I'm going to stick to what many
folks have suggested: just have the host require external information.
What this means is that at VM creation time, the user has to specify
an extra flag that all memory has to be accepted in firmware before
booting the guest OS. Failure to provide the flag leads to the
unfortunate outcome that the VM only has access to the lower 4GB of
RAM. We can only hope that the VM OOMs shortly after they start up the
machine and the user reads an FAQ that they should add this flag.

I'll do a round of appeals to distributions to include this patch set
and AMD's follow-up that defines accept_memory for SEV-SNP to reduce
the time that people need to know about this flag.

-- 
-Dionna Glaze, PhD (she/her)
