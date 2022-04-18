Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052033D61
	for <linux-coco@lists.linux.dev>; Mon, 18 Apr 2022 23:48:41 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id x33so26622120lfu.1
        for <linux-coco@lists.linux.dev>; Mon, 18 Apr 2022 16:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k7vM5EGVT6KdI2swDwwcMXe776ynFb2Yl6IyzXfhJeI=;
        b=ESJRhquLN+MAL6lYlIl1smm5L7nmQA6K/3ntXSz9NsXtT1TEGjkzafLRKabL5qiufu
         Iw6sEWGXKrpl+lr94lWBsYjN0LOFTF8ZzgrdlrfaE/LfSTfnRuXJptSysxzL1I9FmiuA
         H392o4Tq275UsUGpk9mXQYqbXUx0WlX2x9D13md4h8+JNoPaCvd1TRrSL1sXlLoFUjVq
         3wTQauIMFjKO5rU03tpSKCz3ODoVjo+UyOjZpHVTsqHRfsnEQ3zVADKtYUoXWG2R/fce
         BJtDTSjR5RAGVW2gMMYgPG9nA+BnkS8xpHs4/Jk3Ft4vNy9C2j3lKwV6KfJ2KPGRCzxN
         3JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k7vM5EGVT6KdI2swDwwcMXe776ynFb2Yl6IyzXfhJeI=;
        b=Im3tpeWQRZOBDQwLWdPHa02ch1DlRUdwV71U99xUBXTNC+PRXrR57wKxtZwUJ+PDLz
         KZR/Cq92GWwrYhm4Q75QeO1ptSNo+BvtDHsXIww0pYBxRUXOz4W6jVpMn8uik3JjDkiR
         ije6GkTILy+/aFKNPwK2Xbk051Xw70Z8AA69d+HeIGRgMwSY+3f7hSOlWkiHx7FExaI9
         1Jz0x5Rl4qpOA7zSLFZyAoHNpEvqDYqFbMYSijpzPc6wNiV35rHsQq6glpa09vg1QJ+M
         Au8PkJgT84OIo3sKnmJWxaYakTsIK8qVegkMP/LIXrj2/kdBKwuUuly7EQX7bkZgvPAU
         TWlg==
X-Gm-Message-State: AOAM530DA6XQlpeUfrGHC4dN9jlPBV5mZBj1Iyf5u1//VXxq7A5n31lE
	gas+rezpJDipQY3+1GD9NG9jIg==
X-Google-Smtp-Source: ABdhPJxArqQbpLtSwHC4s3C/gv0LTHHj+6hI8Gu7EpEcRHZoKPTgTvSPnILonPZbmaIh9Q56Vhx+7g==
X-Received: by 2002:a05:6512:33cc:b0:471:a439:8397 with SMTP id d12-20020a05651233cc00b00471a4398397mr1174152lfg.551.1650325719967;
        Mon, 18 Apr 2022 16:48:39 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a056512052600b0046f07d71846sm1222838lfc.163.2022.04.18.16.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 16:48:39 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id D13A5103A61; Tue, 19 Apr 2022 02:50:15 +0300 (+03)
Date: Tue, 19 Apr 2022 02:50:15 +0300
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
Subject: Re: [PATCHv4 3/8] efi/x86: Implement support for unaccepted memory
Message-ID: <20220418235015.mnujtlmmlyin7y6m@box.shutemov.name>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <20220405234343.74045-4-kirill.shutemov@linux.intel.com>
 <Ylnwmvygp796+qcA@zn.tnic>
 <20220418155545.a567xnxa6elglapl@box.shutemov.name>
 <Yl2UHOQ4iZJ29k0q@zn.tnic>
 <20220418202431.whvql4w57c7l5vpw@box.shutemov.name>
 <Yl3RmPhdZieSr8W2@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yl3RmPhdZieSr8W2@zn.tnic>

On Mon, Apr 18, 2022 at 11:01:12PM +0200, Borislav Petkov wrote:
> On Mon, Apr 18, 2022 at 11:24:31PM +0300, Kirill A. Shutemov wrote:
> > <linux/bitmap> doesn't include <linux/kernel.h> or similar things.
> > Is it okay for now?
> 
> No, it is not ok because those linux/ includes are moving targets. They
> keep changing and then that indirectly influences the decompressor.
> 
> How much functionality from linux/bitmap.h do you actually need?

Below is the bare minimum required to compile bitmap.c in decompresser.
I only made it work on my config/compiler and did not care about all
#ifdef branches.

I find it strange that you go after <linux/bitmap.h> which has limited
exposure while <linux/acpi.h> and <linux/efi.h> are there already.
Starting small will backfire if once we find out that monstrous headers
depend on what we try to replace. Bit fish has to be addressed first.

What do you want me to do here?

// <linux/bitmap.h>
//
#define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
#define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))

// <uapi/linux/swab.>

/**
 * __swab64 - return a byteswapped 64-bit value
 * @x: value to byteswap
 */
#ifdef __HAVE_BUILTIN_BSWAP64__
#define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
#else
#define __swab64(x)				\
	(__builtin_constant_p((__u64)(x)) ?	\
	___constant_swab64(x) :			\
	__fswab64(x))
#endif

static __always_inline unsigned long __swab(const unsigned long y)
{
#if __BITS_PER_LONG == 64
	return __swab64(y);
#else /* __BITS_PER_LONG == 32 */
	return __swab32(y);
#endif
}

// <linux/swab.h>

# define swab __swab

// <linux/bits.h>

#define BIT_WORD(nr)		((nr) / BITS_PER_LONG)

// <asm/bitops.h>
//
/**
 * __ffs - find first set bit in word
 * @word: The word to search
 *
 * Undefined if no bit exists, so code should check against 0 first.
 */
static __always_inline unsigned long __ffs(unsigned long word)
{
	asm("rep; bsf %1,%0"
		: "=r" (word)
		: "rm" (word));
	return word;
}


> > But the goal of the function is not to accept the memory, but mark it
> > as unaccepted in the bitmap.
> 
> Really?
> 
> +	 * Accept small regions that might not be able to be represented
> +	 * in the bitmap:
> +	 */
> +	if (end - start < 2 * PMD_SIZE) {
> +		__accept_memory(start, end);
> 
> That looks like it is accepting to me.

Yes, really.

As 1 bit represents 2M, not all chunks can be represented in the bitmap
and they have to be accepted. But the *goal* is to record unaccepted
memory into bitmap. Some accepting is a side effect.

The early_accept_memory() name is just wrong.

> > Conceptionally, it is just memory that requires additional action before
> > it can be accessed. Yes, at the moment TDX and SEV are the only users.
> > It is implementation detail that TDX and SEV use memory encryption.
> 
> So there *might* be some potential future use. Nothing concrete at the
> moment.
> 
> > Because I don't think it is a good fit. Frankly, even <asm/coco.h> fits
> > better, although I'm no a fan either.
> > 
> > Do we have file shortage? I would rather keep it separate.
> 
> So I have not read a single argument for why the unaccepted memory gunk
> should be separate.

> We have perfectly fine mem_encrypt.[ch] files everywhere which already
> contain code which deals with the kernel running as encrypted guest.

And some stuff for encrypted host (SME).

> The unaccepted memory stuff is part of that - not something separate. If
> it gets to get used for something different, sure, then it can be carved
> out because it might need to be built separately, without the rest of
> the encryption code. But as it is now, it doesn't have to. So please put
> it in those files.

Okay, I will do as you want, but I really hate it.

With one hand you try to unwind header mess in decompresser code and with
another propose to create a kitchen-sink header because topics somewhat
related. Looks contradictory.

-- 
 Kirill A. Shutemov
