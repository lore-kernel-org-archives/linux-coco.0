Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0287F
	for <linux-coco@lists.linux.dev>; Fri,  6 May 2022 15:28:30 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id i10so13149271lfg.13
        for <linux-coco@lists.linux.dev>; Fri, 06 May 2022 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Zft6jLRsO2R4fi/u6eN2DfU9nqCVAT62ZsK14nFpt1E=;
        b=XDOiXFe386wjEOozpamYgEKo6bjtMbmjBf6MAneBln9fKLJlP6D2htacG8pzD1PGag
         BDq35Fa8Jpg8S9B46om+RPRvalMJRvhTP12mCthVw04+GIgsTZZ7yVjRl0C2uaZpdQHC
         8OpoKg0LwaxmGb/ePwtsDwYTb3jaSpG+mwpzDih1r/KU1JVhv8MR88J3nqjoxUySV0OI
         5N4XU13sXdHYAnCl7C6y700kjlTOas6pb2SdDml26o3R7qJD6Z+elI87woyqaQY5fKXw
         jj2vMHlsbxuxthwiM0wNModQBoVRqRPRT7CB8psqAq0/tw5mU99TYQsucmHQg68j/agn
         GQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zft6jLRsO2R4fi/u6eN2DfU9nqCVAT62ZsK14nFpt1E=;
        b=hNf798MgoBgBskFTwIWhTlgHNEB0+C8kerkc7+3Kl6/rM9cbY38qm2At8OLFY8ScgI
         7YI8YOi3acNrOTtFpUO1heaJ1t0r+lAeAA9Z0Va6M6dKnalHfwgkyKPzWNOkIYKZtZQi
         rwi8QMqX5/TzXIIrz4KL0ci2xZG3JlOtAO52+F/LlKtE+/BRWlHwsNnaUUQWLLVbAL1g
         JkBM3siYKG5/H1fgPfJhdp+8qN5H85pDKsa2Vwdf2sqA2co2szY1XrfREmcE7fqAHrGR
         +fEG/0HBGgSw/hJVbsIn5Feg8oDpMP0vcL2HHkFu/2SOR0Y+K8I38QXOG6tLAlv+CKb2
         n1yA==
X-Gm-Message-State: AOAM533neCiFKMtVSVzutjIIbK3I2+kJfKapa0seCvHaHys6ijqz6tnN
	/dZpCQ52+O6wxph6y66SkuNciQ==
X-Google-Smtp-Source: ABdhPJzSks1evkqP1ANajMwXUMiRnp5YNHTtlO8WobyEatT1ULtkq78uH626+6mTFAvCVPK3HC3lUw==
X-Received: by 2002:a05:6512:12c9:b0:473:c4c1:5558 with SMTP id p9-20020a05651212c900b00473c4c15558mr2929618lfg.75.1651850908074;
        Fri, 06 May 2022 08:28:28 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id o11-20020ac2494b000000b0047255d2118dsm721772lfi.188.2022.05.06.08.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 08:28:27 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id 8AB91104AFD; Fri,  6 May 2022 18:30:13 +0300 (+03)
Date: Fri, 6 May 2022 18:30:13 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Borislav Petkov <bp@alien8.de>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 06/12] x86/boot/compressed: Handle unaccepted memory
Message-ID: <20220506153013.e6v4q2qhuhqumfiu@box.shutemov.name>
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-7-kirill.shutemov@linux.intel.com>
 <YnE4ZzzVrxUnr3Uv@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnE4ZzzVrxUnr3Uv@zn.tnic>

On Tue, May 03, 2022 at 04:12:55PM +0200, Borislav Petkov wrote:
> On Mon, Apr 25, 2022 at 06:39:28AM +0300, Kirill A. Shutemov wrote:
> > diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
> > index 411b268bc0a2..59db90626042 100644
> > --- a/arch/x86/boot/compressed/kaslr.c
> > +++ b/arch/x86/boot/compressed/kaslr.c
> > @@ -725,10 +725,20 @@ process_efi_entries(unsigned long minimum, unsigned long image_size)
> >  		 * but in practice there's firmware where using that memory leads
> >  		 * to crashes.
> >  		 *
> > -		 * Only EFI_CONVENTIONAL_MEMORY is guaranteed to be free.
> > +		 * Only EFI_CONVENTIONAL_MEMORY and EFI_UNACCEPTED_MEMORY (if
> > +		 * supported) are guaranteed to be free.
> >  		 */
> > -		if (md->type != EFI_CONVENTIONAL_MEMORY)
> > +
> > +		switch (md->type) {
> > +		case EFI_CONVENTIONAL_MEMORY:
> > +			break;
> > +		case EFI_UNACCEPTED_MEMORY:
> > +			if (IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
> > +				break;
> >  			continue;
> > +		default:
> > +			continue;
> > +		}
> 
> Is there any special reason for this to be a switch-case or can it
> simply be a compound conditional if (bla...) ?

The equivalent 'if' statement is something like:

		if (md->type != EFI_CONVENTIONAL_MEMORY &&
		    !(md->type == EFI_UNACCEPTED_MEMORY && IS_ENABLED(CONFIG_UNACCEPTED_MEMORY)))
		    continue;

I find it harder to follow.

Do you want me to change to the 'if' anyway?

-- 
 Kirill A. Shutemov
