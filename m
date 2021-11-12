Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A0268
	for <linux-coco@lists.linux.dev>; Fri, 12 Nov 2021 21:16:54 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id p2-20020a4adfc2000000b002c2676904fdso3337617ood.13
        for <linux-coco@lists.linux.dev>; Fri, 12 Nov 2021 13:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wss/5FTdvL/ZsvqJzpcpP0vdH9OVb8c+LLdYEkdhnSs=;
        b=rH4CDA2O6JCJq7jEtKrpJB3naSzfLAW3EwcXwJBgz8NHwCbEfX4Y7uVz+LkZr+hrEJ
         +I0JUbdCZ0Eg+jU7wr0UWgv5MDmCQEwSLGmghVhPsyXWCJLkgNTbAEEIodMi2vC+nDGP
         vAnO27RJCLMGr+oQH3ulQDVXl+wQnrPymGwD+C8Ct6C3DeEXgjsqVjqN+hGRnsLmOFi8
         nPkzBkWeT1G3yIcW2QZxvHaZQmPv3Hr+tSGUPT0LwTUvBEwM3VTfJSuVQ97JJ6+ohD0v
         sm4Jcwh4byJx7uc264omN9uaYgtuYaY49B2I53HH1xF8Dj1+neZHJFB8B1P12TfFku+L
         wdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wss/5FTdvL/ZsvqJzpcpP0vdH9OVb8c+LLdYEkdhnSs=;
        b=qS6RRxiyp+1BL6cMpRQq2/UBzEYwj762/rrCvBEujKy/A0QWUv22yFyQbzW1oC4ds9
         8K8v0nl6PwaZ6nxzN3WOhO9E+RwQDExT7+0C0++kEGTYz8a7MMZ1TT3VSdtpIJTReVEQ
         wmWQXSb4WkYL3nIs/CvuAGSjIcne0GkRcvJSdy6UAUGmFDK4yR52g5kFoZ01O8rdyQxw
         /CS4qOZFiekQbm4Bbty285ABJW6seY1tgQcHJPa8WxlaOiYTfpEYskKXiC0qWa+T/L4L
         +s+yshOjZQjkTLQy4W3Un8WW3gaCQW2s4IbGzQ2bx3I5TF3eqZ+jvsy8LjJlKfSIceUF
         lR7A==
X-Gm-Message-State: AOAM533hcXgrcjh0QG6yHTDxTOcSX8YtyInfiWIFsl3XZxlSyTfjOWth
	YlK+OFRQwnj04sTnrLyHeMZ84uuOtYcR5nW6mdoXhA==
X-Google-Smtp-Source: ABdhPJyat1/wejZeYNbgqmYOxRGD7fk2dWxHtnIZDfKhyhl6kHLjSWImplcgB28WjBzJ96p1EICE1Qugb0LOIJXrx6U=
X-Received: by 2002:a4a:dc1a:: with SMTP id p26mr10372786oov.6.1636751813173;
 Fri, 12 Nov 2021 13:16:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210820155918.7518-1-brijesh.singh@amd.com> <CAMkAt6o0ySn1=iLYsH0LCnNARrUbfaS0cvtxB__y_d+Q6DUzfA@mail.gmail.com>
 <061ccd49-3b9f-d603-bafd-61a067c3f6fa@intel.com> <YY6z5/0uGJmlMuM6@zn.tnic> <YY7FAW5ti7YMeejj@google.com>
In-Reply-To: <YY7FAW5ti7YMeejj@google.com>
From: Marc Orr <marcorr@google.com>
Date: Fri, 12 Nov 2021 13:16:42 -0800
Message-ID: <CAA03e5EpQZnNzWgRsCAahwwvsd6+QVnRHdiYFM=GhEb2N1W0GQ@mail.gmail.com>
Subject: Re: [PATCH Part2 v5 00/45] Add AMD Secure Nested Paging (SEV-SNP)
 Hypervisor Support
To: Sean Christopherson <seanjc@google.com>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@intel.com>, Peter Gonda <pgonda@google.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	Tom Lendacky <Thomas.Lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, 
	Michael Roth <Michael.Roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

> > So cloud providers should have an interest to prevent such random stray
> > accesses if they wanna have guests. :)
>
> Yes, but IMO inducing a fault in the guest because of _host_ bug is wrong.

I want to push back on "inducing a fault in the guest because of
_host_ bug is wrong.". The guest is _required_ to be robust against
the host maliciously (or accidentally) writing its memory. SNP
security depends on the guest detecting such writes. Therefore, why is
leveraging this system property that the guest will detect when its
private memory has been written wrong? Especially when its orders or
magnitudes simpler than the alternative to have everything in the
system -- kernel, user-space, and guest -- all coordinate to agree
what's private and what's shared. Such a complex approach is likely to
bring a lot of bugs, vulnerabilities, and limitations on future design
into the picture.
