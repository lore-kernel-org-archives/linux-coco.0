Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2964F6D13
	for <linux-coco@lists.linux.dev>; Thu, 12 Aug 2021 21:17:21 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id w20so15965294lfu.7
        for <linux-coco@lists.linux.dev>; Thu, 12 Aug 2021 14:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b2BirSVgdv61++1qgCbkrnEDz6Qii/PCQKwWPaT0kRE=;
        b=VXmNW/rBJjdUX9bbBX1Ste1p1ni7x23r3FJaTKr3DW4fSW4SfMOjOvvLLadmtYdpQO
         9w03+1YiJybcJHP6mCNeW6hfv0Lxz0nEktyf7Kyn7XA2D63hOgBVjOT3XNBpIqe9ENNN
         f7BBJC8R6fcBzt+RfzsK7e93zOmRpIgy8Ug4dfESSUA+NO/fUnva/RYm3FuAjdIskbVM
         2GMapYddrr6YMdGjT2yHJ99APmM9o/ef0nymvWWWi5b08V+ixhnntkmGKyO6te6SX6IM
         hMmU7uW9OHFG9WrQq9Hal7fItPeI/pSkXgCN7Wk0wJJhGEIPbvVFbaqsaWChG/wqjFle
         ODVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b2BirSVgdv61++1qgCbkrnEDz6Qii/PCQKwWPaT0kRE=;
        b=DEUHltvrv3s4c/RX0n9nO4kFs9tjXnMfuJwu3WFY2o78kHucTui4gbnNUgnareqBR7
         60WvL5L+1Jvjx5LPGtqLD7dMdCcYUqmPcVzR6Dzc2gid15Yei28+EMXY35dHc4msPjGi
         aNt2KbBq2tgym5Ltdh5vnKyI75sw5wbJzqJOKQh2BRYhdGWBOT92TstnrhUJ2u4/iJMf
         LcZbTnzOYpBfKmvDjGXhNlWvIwuX+eVbkvnIZi4pJVhHm76PPqg3zM3wzvgAARODmKvY
         eosuogTxSmgbdAUcZYjJzqxZ4dpEnYMrBWf4uvVGVozBbaafHiTSoAYIzaEnsf6QvUQB
         yfew==
X-Gm-Message-State: AOAM533f5EjWu5uJt5lKHvvCE5I1+Z92V2DFnWFT0GtKtWnb8NZ+paZc
	zr8OcDEflrWoa3sRdAG2QTgzog==
X-Google-Smtp-Source: ABdhPJxqIiUrSNtMEkd3DckwzHM+lwkbd5+BtE5CifV6cR0ixYu839okyszKguc39ACYMEkzvwj5zA==
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr3941318lfd.529.1628803039302;
        Thu, 12 Aug 2021 14:17:19 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id p2sm371787lft.157.2021.08.12.14.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 14:17:18 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id 69A1C102BEE; Fri, 13 Aug 2021 00:17:32 +0300 (+03)
Date: Fri, 13 Aug 2021 00:17:32 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] efi/x86: Implement support for unaccepted memory
Message-ID: <20210812211732.l46uwa5p22s4nsqg@box.shutemov.name>
References: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
 <20210810062626.1012-3-kirill.shutemov@linux.intel.com>
 <07c2770e-1171-24ab-9403-91b306b5b1a4@intel.com>
 <20210810190836.cffj4fjqenuunwsd@black.fi.intel.com>
 <ef45d48f-2e7f-850e-f4d0-f518d34c598d@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef45d48f-2e7f-850e-f4d0-f518d34c598d@intel.com>

On Tue, Aug 10, 2021 at 12:19:22PM -0700, Dave Hansen wrote:
> On 8/10/21 12:08 PM, Kirill A. Shutemov wrote:
> >>> +config UNACCEPTED_MEMORY
> >>> +	bool
> >>> +	depends on EFI_STUB
> >>> +	help
> >>> +	   Some Virtual Machine platforms, such as Intel TDX, introduce
> >>> +	   the concept of memory acceptance, requiring memory to be accepted
> >>> +	   before it can be used by the guest. This protects against a class of
> >>> +	   attacks by the virtual machine platform.
> >>> +
> >>> +	   This option adds support for unaccepted memory and makes such memory
> >>> +	   usable by kernel.
> >> Do we really need a full-blown user-visible option here?  If we, for
> >> instance, just did:
> >>
> >> config UNACCEPTED_MEMORY
> >> 	bool
> >> 	depends on EFI_STUB
> >>
> >> it could be 'select'ed from the TDX Kconfig and no users would ever be
> >> bothered with it.  Would a user *ever* turn this on if they don't have
> >> TDX (or equivalent)?
> > But it's already not user selectable. Note that there's no prompt next to
> > the "bool". The "help" section is just for documentation. I think it can
> > be useful.
> 
> Ahh, gotcha.  I misread it.  Seems like an odd thing to do, but it's
> also fairly widespread in the tree.
> 
> Can you even reach that help text from any of the configuration tools?
> If you're doing an 'oldconfig', you won't get a prompt to do the "?".
> Even in the 'meunconfig' search results, it doesn't display "help" text,
> only the "prompt".

I don't know how get a tool show the text, but my vim sees just fine :P

> BTW, should this text call out that this is for parsing an actual UEFI
> feature along with the spec version?  It's not obvious from the text
> that "unaccepted memory" really is a UEFI thing as opposed to being some
> kernel-only concept.

Okay.

-- 
 Kirill A. Shutemov
