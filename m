Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F846719
	for <linux-coco@lists.linux.dev>; Wed, 24 Aug 2022 18:01:29 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-335624d1e26so481526717b3.4
        for <linux-coco@lists.linux.dev>; Wed, 24 Aug 2022 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=DGuV+oKzfmFfApe8NxA2paN6tKmjViwBVg9JpKKUVew=;
        b=aK7CLkv5P2RcCIQ4lBOyr8TSYIWgo/S7IAXUY+CksZwIzy0GAUD2JwRUYl1mFSlNy1
         AlZYZ+MSnfLOvbuZkVTyk5hYpkNwyfw7XjHdVZIEBzoniE+PdMWI3Dkur8HhBI1VH++3
         zG2zC0bKMzKEiqxXi/wzfVrA6uOVxHU694jVkzxalWH/7oz6JhUVaNQgLaUVbsF4Ja+t
         m3unpH32vONLlCtLiTtPrym5TcCuV3jdyoTEvGYk3Tv3xyUaF9kJPtsQZ62M2XcawYY2
         /Xq7h71eB0GYT/81B4VArgq0LRAgwploebcVMZfOKDuGJ6M4fYqAWEeqcb1m1QMMjszm
         Wn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DGuV+oKzfmFfApe8NxA2paN6tKmjViwBVg9JpKKUVew=;
        b=pLkYvCu5YxHakpTuTGQtLViijEk2wj0rUovMKTAIyCDnGrJjutpmEFK3fWvxJM05U7
         kqWau5nQgUNvYoaPVmVEq4rnXVdTXI2hmuHBaHtyj6A1vPOVkZk1fYKbfutV99xgMxRL
         Rzz7yKH5LpDDH9LcRTX69zIJBmI4We2WCEYdoQcg5FZxTc+zYFT14xteyUXt+eHZjGF9
         AnzeKzrtqxFaOdwVIsXx9n3bKh/imJs4JPwguELMVAODtmD2n79O1QcFR9WbaAdxC9/n
         4mpM4XuMfNhFxpxaARyL+W29KzZ4yTHcn8JoDv6pPF1S1fqUFMX10c3aAw+RG0KAClnh
         jf3Q==
X-Gm-Message-State: ACgBeo3cEwfWzgHut6xG/hbfBS/JmQCsWmAfzDMS2XJBab4/Hv9x4uOi
	f7wMEiU/Ftc7KZc1Mw/57BM/ppR04ui1SxuNq6sGgw==
X-Google-Smtp-Source: AA6agR4krDxQhq5Y+22wT3eQhzuO1h8jJucGBjy3TIVyLauaMRohf/vMydVZsogFXj4WyTvzKkerLZ1BkZP/rZzLJXI=
X-Received: by 2002:a81:6f43:0:b0:335:9e7e:ad25 with SMTP id
 k64-20020a816f43000000b003359e7ead25mr347464ywc.518.1661364087931; Wed, 24
 Aug 2022 11:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220307213356.2797205-1-brijesh.singh@amd.com> <20220307213356.2797205-44-brijesh.singh@amd.com>
In-Reply-To: <20220307213356.2797205-44-brijesh.singh@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 24 Aug 2022 11:01:16 -0700
Message-ID: <CAAH4kHYm1BhjJXUMH12kzR0Xun=fUTj-3Hy6At0XR_09Bf0Ccw@mail.gmail.com>
Subject: Re: [PATCH v12 43/46] virt: Add SEV-SNP guest driver
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: "the arch/x86 maintainers" <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:X86 KVM CPUs" <kvm@vger.kernel.org>, linux-efi <linux-efi@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-coco@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, 
	Peter Gonda <pgonda@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, 
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, brijesh.ksingh@gmail.com, tony.luck@intel.com, 
	Marc Orr <marcorr@google.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Apologies for the necropost, but I noticed strange behavior testing my
own Golang-based wrapper around the /dev/sev-guest driver.

> +
> +static int handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code, int msg_ver,
> +                               u8 type, void *req_buf, size_t req_sz, void *resp_buf,
> +                               u32 resp_sz, __u64 *fw_err)
> +{
> +       unsigned long err;
> +       u64 seqno;
> +       int rc;
> +
> +       /* Get message sequence and verify that its a non-zero */
> +       seqno = snp_get_msg_seqno(snp_dev);
> +       if (!seqno)
> +               return -EIO;
> +
> +       memset(snp_dev->response, 0, sizeof(struct snp_guest_msg));
> +
> +       /* Encrypt the userspace provided payload */
> +       rc = enc_payload(snp_dev, seqno, msg_ver, type, req_buf, req_sz);
> +       if (rc)
> +               return rc;
> +
> +       /* Call firmware to process the request */
> +       rc = snp_issue_guest_request(exit_code, &snp_dev->input, &err);
> +       if (fw_err)
> +               *fw_err = err;
> +
> +       if (rc)
> +               return rc;
> +

The fw_err is written back regardless of rc, so since err is
uninitialized, you can end up with garbage written back. I've worked
around this by only caring about fw_err when the result is -EIO, but
thought that I should bring this up.

--
-Dionna Glaze, PhD (she/her)
