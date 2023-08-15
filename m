Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AC5134CE
	for <linux-coco@lists.linux.dev>; Tue, 15 Aug 2023 17:16:19 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4036bd4fff1so20961cf.0
        for <linux-coco@lists.linux.dev>; Tue, 15 Aug 2023 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692119779; x=1692724579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1WCcY1DTF2SDkL2C38h5/rIUZSGkzG/CsRQNgHvnx78=;
        b=M6Vx4wfJkJ366sFCowkGvQ+/tOWO0fxXKCqskj3hKgFn5l2JkDOB5JczHT5DRghjkp
         DV6VbcYG8D/gxiY83tG+Orw4OM1ZzoyIhFC7w4p9PWtNuqTFtKthCwrFzNqgt6CJ0gWm
         GsHptxsBfryyqd+kX21dJbj76UtP5YksoujiDKi18lAl4vcJhoH0DyG9S3Zq3RcxhOEC
         Yfti0RtdYszrEhnONH7e2kZvYknbFDgCf6y8YcD9RHfP//9dEUcwRJzrjh1PLL/D5Rr/
         VL+sDINBBTQZXBZg1Yvpumg3DuV7AdCL200x/BIOLDjEysi2fZpD6C8LosVbuyIUku1o
         kNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692119779; x=1692724579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WCcY1DTF2SDkL2C38h5/rIUZSGkzG/CsRQNgHvnx78=;
        b=FpofhHCiaUPEzxwE2GiR5SnWDpL+QWwH1sAIx6mycpt33aYzAfpErlrNzoatRipzNM
         kxtg32Pw7issvtrtUPmmy+/mpkw2GUmgUukJNlk7jAQy2FvEDp7Mruljngu/oT8FHegg
         gDLfbiXh+K5kn+w2LjPdF04/oJ4AoNHCYySE0DGjdRXM5okiHmaNiPNmI8l2R60rf2F2
         xhMVe3NZmVrUEH6i1/pwb6Z2Y8r2Y9GtDduZE6fKENPrfFtfsCd5qbVD3vBYxEQaSxPN
         12jySA3PTnD0k6+YNX2zr2N6OBqNiZ2cvCr3KbbHTvYitOuTMFTLw8wROKBtNlOjA8U2
         wIng==
X-Gm-Message-State: AOJu0Yx37dwD3nvajhpO5YRp7onWH/NMaHyMdoBiIFe1DuvmhDw0DjQl
	4g8IuUNlcV1IyPnZTu7ZFSuWiOn6bJhlOZBt8owCKw==
X-Google-Smtp-Source: AGHT+IFqL0pfdNfEWIZn8u3qSj/0LPOU2mPsKtOZnp4OjF2evlrmW8cqhJ3XupOOj5c2cRH/ZWnXdCm5O18SK7V080k=
X-Received: by 2002:a05:622a:1106:b0:403:e1d1:8b63 with SMTP id
 e6-20020a05622a110600b00403e1d18b63mr11535qty.24.1692119778732; Tue, 15 Aug
 2023 10:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
 <57f3a05e-8fcd-4656-beea-56bb8365ae64@linux.microsoft.com>
 <64da606b171cc_2138e29484@dwillia2-xfh.jf.intel.com.notmuch> <CAMkAt6q1ZedWBQ+ZLmD5QRKc0jcz2nrdwEAw6g8R2fZ5e2ed_A@mail.gmail.com>
In-Reply-To: <CAMkAt6q1ZedWBQ+ZLmD5QRKc0jcz2nrdwEAw6g8R2fZ5e2ed_A@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 15 Aug 2023 10:16:07 -0700
Message-ID: <CAAH4kHYCofTtdjpxKMLO8CMX6kZjQUG69mbbwerwuW0Pk6up9A@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] tsm: Attestation Report ABI
To: Peter Gonda <pgonda@google.com>
Cc: Dan Williams <dan.j.williams@intel.com>, 
	Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, linux-coco@lists.linux.dev, 
	Brijesh Singh <brijesh.singh@amd.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Borislav Petkov <bp@alien8.de>, Samuel Ortiz <sameo@rivosinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Why do we need to be so prescriptive about "boot time" vs "runtime"
> attestations? A user may wish to attest to several requests as Jeremi
> notes. And why should users be forced into using a vTPM interface if
> their usecase doesn't require all the features and complexity of a
> vTPM? Some users may prefer less overall code within their Trusted
> Computer Base (TCB) and a TPM emulate is a significant code base.
>

I agree, and I was a bit too hasty to acquiesce to sysfs due to the
TPM argument that really only applies for SEV-SNP without a whole lot
of extra work for other backends (not to say SVSM isn't itself a whole
lot of extra work).

> It seems like you are just reading the SNP spec, if you read the TDX
> spec you'll see there are RTMRs which can be extended with new data.
> This leads to a different data in the attestation. Similar there are
> REMs in the ARM CCA spec.
>

I'll add a note here that measurement registers are extensible at any
point by ring0, and there should be an API for doing so, the way that
there is for /dev/tpmX.

It could be /dev/teemr or something to unify TDX, COVE, ARM CCA, and
potentially a measurement register protocol extension to SEV-SNP's
SVSM.
I'm not sure how Intel is going to propose abstracting TCG Canonical
Event Log measurements to reuse measurement-to-PCR<X> code points in
the kernel as measurement-to-MR<f(X)>, or whatnot, but each technology
should have that implementation option to extend their own measurement
registers (and event log, potentially).

I (and probably James) object with just saying the PCRs are going to
xyz-measurement-register for simulating that integrity part of a TPM
to get just the quote aspect and not the rest of TPM 2.0 to hide
everything behind the TPM abstraction. It doesn't follow the Tcg spec.

But I repeat myself. If we use any ioctl, we'll end up multiplexing
the input per-technology, and at that point we essentially have
manufacturer-specific devices much to Dan's dismay.

Sysfs will certainly not be okay for measurement register-only
technology, since there's no way to not use a hardware attestation to
securely track measurement changes past "the static boot" (PCRs 0-7).
I don't want to have to rely on enclave-like peer VMs that perform the
TPM behavior.

-- 
-Dionna Glaze, PhD (she/her)
