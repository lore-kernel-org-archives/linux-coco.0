Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1542B425
	for <linux-coco@lists.linux.dev>; Thu, 19 Jan 2023 18:49:55 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id b12so2270321pgj.6
        for <linux-coco@lists.linux.dev>; Thu, 19 Jan 2023 10:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xNVXfWTFHPUTtkdhJd1rvFQYW6suzNo+IYrlxBerVjw=;
        b=JCfzsF2f0L14x6DnDb97ikzDMd+kmDUm+hY4g0ikovS6VCInjBWJHaf/91emjlkbvv
         7wIBq95BwSi0sYX+qpZD/SDvgq6Rh0mChGWHNsKn3x3hLmQ8FzFzJ8/ZbJBpvglwgQ4P
         DCgQbf4DC/hZmnSwoV0J3qJIQ2CUCL3azLbW7iE8ZYMMJf7aB+WsETKfdqrzzfEJ6ojU
         vsPAh6PoOnotNaQto+c0+ylg5pDTEUWQjzlqfqHA4n+xq9Aj/eYU3tjl8BclPsCxy96X
         tvpdUK9qzbs7kasSXAsdoo6MSNp8cPe7grioN6SM05rjDR6+YxuYdpreH2mSGn1YnH2i
         7GNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNVXfWTFHPUTtkdhJd1rvFQYW6suzNo+IYrlxBerVjw=;
        b=1l25NpvbKw6ckMZk8ykSQJ1MJ1dIrzUsWW0U8TRUV3sHekVnAZuE/8qcncsGvY8a4p
         iEPslBIY20uyE9HH0p9BJdlah0MTirtVTM4LLpj9k0PQ2w2oyourvbivtupKrl3WbgAb
         4Xf6aFGhgMbeLs2shB8vbV3JXSHviQqStCLxebOq3YjyqK00RQ0gOOVQUpVFRhkHVIvg
         VwWuNJ9gW68L+iA1SCE8uCECF48+c7SAGvRTahx1gDrPN4XIhXoGmoLOGBeWcLh4z2Kv
         T9aI2T2dKOl8PGMIVLbf7H/eou0F8YxmkCCYzayOm+k8UcSecIMtjnN8ThNRqqBlAiFz
         KTVQ==
X-Gm-Message-State: AFqh2kpiFZmST7vTSIWnqbLeTNRRWVP/+QVtXgSLwH3IGF4II2JHCLhx
	mCRNjNsXtQj+IQzdwaOzggvrZDOMSQmt6dBtaMkLlA==
X-Google-Smtp-Source: AMrXdXs6HTI9i0wEtQHX5RB47auesuGHCq06fYXVQ7aeMwYLK4yjX/E0p+7CcZlE0F4L6rvrtuk8H7gqPyauTnlR1T4=
X-Received: by 2002:a63:d455:0:b0:478:ae53:a299 with SMTP id
 i21-20020a63d455000000b00478ae53a299mr956491pgj.260.1674154194728; Thu, 19
 Jan 2023 10:49:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221214194056.161492-1-michael.roth@amd.com> <20221214194056.161492-63-michael.roth@amd.com>
In-Reply-To: <20221214194056.161492-63-michael.roth@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 19 Jan 2023 10:49:43 -0800
Message-ID: <CAAH4kHZVaeL57bGAzeDjJDTumsnb96iAYBdhm7cs_8TjBg+v3w@mail.gmail.com>
Subject: Re: [PATCH RFC v7 62/64] x86/sev: Add KVM commands for instance certs
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, vkuznets@redhat.com, wanpengli@tencent.com, 
	jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com, 
	slp@redhat.com, pgonda@google.com, peterz@infradead.org, 
	srinivas.pandruvada@linux.intel.com, rientjes@google.com, 
	dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz, 
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org, 
	ashish.kalra@amd.com, harald@profian.com
Content-Type: text/plain; charset="UTF-8"

> +
> +       /* Page-align the length */
> +       length = (params.certs_len + PAGE_SIZE - 1) & PAGE_MASK;
> +

I believe Ashish wanted this to be PAGE_ALIGN(params.certs_len)

-- 
-Dionna Glaze, PhD (she/her)
