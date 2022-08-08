Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34DE440F
	for <linux-coco@lists.linux.dev>; Mon,  8 Aug 2022 23:25:35 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id j63so15922818ybb.13
        for <linux-coco@lists.linux.dev>; Mon, 08 Aug 2022 16:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=73cKPFgN9gZ8ltMONiXdX091+tMrsz21e0W09IrrYVM=;
        b=XD4epq/wDO2pmaef1oiInC2dvEJIqvjq3q43Jfyj+ci5MUe0R+m7gQ5gr1x+XrMC76
         LwLhtdXIbgRaVYj9MQHPhkljoWaVUbOD+Rn2R/6VQJfsCEUnZFnf0jVXFjOKLFdW6lBI
         AQd3NhDC5HNC3/vyl8bHZJAkJILyum23NniPcQLdokRSRh3BOH9Pvf+6pzNo9iHp97GO
         k+JFH6u4VVeMcZD5etwHx3zffyFTqC6FwhBiOzN9Qi+PU0a55A/i9Qsq66IR5/bRPQl6
         Wo8EHYyvtyS5q4HqsP0RoQyycONWLoK9J3yYPmOqKiFDyUUXf5a88zIoeXUvyeGRrLXP
         U/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=73cKPFgN9gZ8ltMONiXdX091+tMrsz21e0W09IrrYVM=;
        b=SNnqQdP3pR6JORvBxOEtqpChOeplhJsG/zin74c1VKAkvMOIoQd+orgvCr1chGrssm
         qP92rrMvQabmc7FuNr2I4rDV0OGRfG+kq3QxTlE+gxaEg4Ah/GBAba4/nE2o52S4GSPp
         n1wUoL3G3PlUS/dizlI4l5y7xaSEkr1VOb/YThtq2Ax9luehm/SoqEGc0XTLM9VwVQie
         fDWcFd8N/qUxwTftDjiubSQUq7b3dADHMpwAR1yuC6TaGYbnAn8hgtDMH18yVjwahYBm
         T2sI7ocGSKwy9MYhWVrT+rJ8wxhyNCDPZ/723BtSSj5vxZpHoBK+0rN2CtiOlQR31B/2
         8RVQ==
X-Gm-Message-State: ACgBeo1zDXbY4yNC7bc3+a3nl+/8ZC0vnbzkFgrqT9uIws3PnlTOM8Gd
	ecA7Li0IKlGHpQk+G5KMqvvKuTc2fNvKI0G2rp9AOw==
X-Google-Smtp-Source: AA6agR7NkhA/E2JJDWORK66aLcG/g1ZA5bYxFqc7io395Oy9dAKo9LEzL/8YuEkKlHfrKtLYRxQ/RoMYCYQoZ3yVrLc=
X-Received: by 2002:a05:6902:1021:b0:676:ed79:5733 with SMTP id
 x1-20020a056902102100b00676ed795733mr18366577ybt.509.1660001134604; Mon, 08
 Aug 2022 16:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655761627.git.ashish.kalra@amd.com> <d325cb5d7961f015400999dda7ee8e08e4ca2ec6.1655761627.git.ashish.kalra@amd.com>
 <YukZFKpAO5o5MLA1@kernel.org> <CAAH4kHazh_S4zTLimL3Bch7yo3zL2wv86j=w3f2n74O-joWLQQ@mail.gmail.com>
 <a4b82687-7143-35c5-ee90-003a9f2a088c@amd.com>
In-Reply-To: <a4b82687-7143-35c5-ee90-003a9f2a088c@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 8 Aug 2022 16:25:23 -0700
Message-ID: <CAAH4kHYHu_FMJJiSNXbSZLn1y297FVq-LdZF7Tmq3t58nfLuLQ@mail.gmail.com>
Subject: Re: [PATCH Part2 v6 17/49] crypto: ccp: Add the SNP_{SET,GET}_EXT_CONFIG
 command
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Ashish Kalra <Ashish.Kalra@amd.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:X86 KVM CPUs" <kvm@vger.kernel.org>, linux-coco@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-crypto@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, hpa@zytor.com, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, vkuznets@redhat.com, Jim Mattson <jmattson@google.com>, 
	Andy Lutomirski <luto@kernel.org>, dave.hansen@linux.intel.com, slp@redhat.com, 
	Peter Gonda <pgonda@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	srinivas.pandruvada@linux.intel.com, David Rientjes <rientjes@google.com>, 
	dovmurik@linux.ibm.com, tobin@ibm.com, Borislav Petkov <bp@alien8.de>, 
	"Roth, Michael" <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com, 
	Marc Orr <marcorr@google.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alper Gun <alpergun@google.com>, dgilbert@redhat.com
Content-Type: text/plain; charset="UTF-8"

> Would it be burden to supply all the certificates, both system and per-VM,
> in this KVM call? On the SNP Extended Guest Request, the hypervisor could
> just check if there is a per-VM blob and return that or else return the
> system-wide blob (if present).
>

I think that's fine by me. We can use SNP_GET_EXT_CONFIG, merge in
user space, and create an instance override with a KVM ioctl without
touching ccp.

-- 
-Dionna Glaze, PhD (she/her)
