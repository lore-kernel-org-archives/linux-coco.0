Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5E28E0
	for <linux-coco@lists.linux.dev>; Mon,  2 May 2022 13:38:50 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id w19so25276291lfu.11
        for <linux-coco@lists.linux.dev>; Mon, 02 May 2022 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DcMGZbv7z3p/v1eaiOcddW90mQtWVDMmjqmh18TpdpI=;
        b=UGAWAyJUXoavkDZu/6uiyPyXQTdFJov3kbe74IyPdqB8tJNB1DkzhUq18MRTgb7Geg
         J1Vpjhyolal+iggBoo5jcEznptqbOvyFBOWCfImJ+5EcVzC20xDOZ8Ve6PAuXTafyIas
         0pLWBUR2ievavlNtXwDxDcP5QZFb8k6nNyibG8HKsPGqBEmZSMaWqKSz1uoFDUkiT22v
         N8nqHaek4ehCqRhJn6rBX30mRbm3knHnTzXmMrPhz5xXFRSI2jjOtq9zbx2ILyrGQagv
         yQRRnzHGMfswyQfLASHEEUMggmLvmdnRge0KT78jvbMsxyU29Cy5spwAxnapnip9DhJQ
         UXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DcMGZbv7z3p/v1eaiOcddW90mQtWVDMmjqmh18TpdpI=;
        b=f8r+Lz6ZVoUldq9dBC7jl5zYQN76yl6+JGRVXPiun9MmO3Y9NpdqUNV6k2eWTcAx66
         +EEwAojdXb4SC4e6kQo7CD5gjNq4LoFUNEUYILRs4TUc7PxIS3EmO6aYLml+pRrUQnq4
         ymm9QCWc98vbPWTV1GSZf3r3Qknc3IAhZrW0czJG5Grxylfy1WgMCTXPd6QBYeA9a4H9
         cyVx8NUk75wqe952pX2UyyplOzL4LX2d2gasw18O4JkqHC6LqlMTVcuk7ZV2AoimxcUv
         QuIrQhJ7QniMpKxpgsaBSrn4pwUiJbBabhX6vjTsdsXVhaIFPxKcExn3iNA0pRt29i+I
         PIAg==
X-Gm-Message-State: AOAM533WRvn0LMOseDcD9tcTCBPGT+IMQGcB3BS+mtC0D8Zx+sIEjltC
	fm+H1EZZrVOlsHv0lC/mjzxTsw==
X-Google-Smtp-Source: ABdhPJwKLan9oIQwmL4/yFUO5pWv5jwZqmLJ0VZW89luPSjNXnrV7OWnfCjA79YKn2buk4EZYnbTPw==
X-Received: by 2002:a05:6512:400e:b0:450:e09d:c9a6 with SMTP id br14-20020a056512400e00b00450e09dc9a6mr9413485lfb.243.1651498728392;
        Mon, 02 May 2022 06:38:48 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e86d5000000b0024cac53a82csm1046025ljj.0.2022.05.02.06.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 06:38:47 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id F1167104AD8; Mon,  2 May 2022 16:40:31 +0300 (+03)
Date: Mon, 2 May 2022 16:40:31 +0300
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
Subject: Re: [PATCHv5 05/12] efi/x86: Implement support for unaccepted memory
Message-ID: <20220502134031.roylivc3icazuk5h@box.shutemov.name>
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-6-kirill.shutemov@linux.intel.com>
 <YmvDqgcyKOgLYNrT@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmvDqgcyKOgLYNrT@zn.tnic>

On Fri, Apr 29, 2022 at 12:53:30PM +0200, Borislav Petkov wrote:
> > +	/*
> > +	 * If unaccepted memory is present allocate a bitmap to track what
> > +	 * memory has to be accepted before access.
> > +	 *
> > +	 * One bit in the bitmap represents 2MiB in the address space:
> > +	 * A 4k bitmap can track 64GiB of physical address space.
> > +	 *
> > +	 * In the worst case scenario -- a huge hole in the middle of the
> > +	 * address space -- It needs 256MiB to handle 4PiB of the address
> > +	 * space.
> > +	 *
> > +	 * TODO: handle situation if params->unaccepted_memory has already set.
> 
> "... is already set."
> 
> And when is that TODO taken care of? Later patch or patchset?

No, not yet. kexec is not a priority at the moment. It will come later.

-- 
 Kirill A. Shutemov
