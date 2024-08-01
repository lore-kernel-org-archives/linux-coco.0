Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2F41B9B32
	for <linux-coco@lists.linux.dev>; Thu,  1 Aug 2024 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722535074; cv=none; b=qwPG3kPTOIXQiZ7EW4PAtbLf+73cMSSfcMOeigeUTRDidNXaj9IwtcWmFXw+3fKHGedIQZ+DprlDMC4qeON944dza4hLEicnXvp2JSwRffmcRBHuSaZvvKVmEt+AGX0vpSx1x6VDaK7nqt+q04wX7PPboXXZnimUv6Z8WmZnd64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722535074; c=relaxed/simple;
	bh=RRnVrODlIXwb4KTZdh1i8JoY9YJHVgr4QPTd7lqZ8sc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m7c8pKcg4WEETC/vgaEEzS5JpgU7u2Is9b4QCuePmLcug7LCpPp8O0SfAMy2L+y79tprfmmkGk+jhIrEPyo0PjIdTdo0bgPPIhqFsUoX5Vb5KKwjBv3hgTZ3ea6zJfL0fmsoc5lBsOUrz420/JaUlZKR229WuD1xMKMu/YHYICo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nxyxWMZ2; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nxyxWMZ2"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2cb5ba80e77so8772234a91.1
        for <linux-coco@lists.linux.dev>; Thu, 01 Aug 2024 10:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722535073; x=1723139873; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZsjMORWNMLw4A5ZHbitxpDYHrl9my8e/hfGilOpgU0=;
        b=nxyxWMZ2VCBJJLklDWtXpp/ohzjKNr2hMgqxLLuN1NxASyIxH+IWKAc7vT1eA5bk7H
         aTE5XNsRzK+tZVbxlKYE740mqnfzzIkc4YlKUJovfukRHv5zjAVMqbC59GCalFLaefCW
         7Mq4Bq95ByiEvv9Wd4nWrzh31n34tUHBI/STgiUhpHG9BkxVrhRhDlt1VlqPbqTSKGt0
         Kw8+yVGJr11qipjmZIOE+YyNq6/yQGUgAduc6GForK3X35SDSdKPPdsooAGDJL1T06Zx
         /DaMxtcKMRbgRF9EC9cZePcsbOLqrVCJ09+Tjm0eEPfFVLkAHq2E/e+SL0/L+u9cikv7
         wEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722535073; x=1723139873;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YZsjMORWNMLw4A5ZHbitxpDYHrl9my8e/hfGilOpgU0=;
        b=jnsLFS5OooM87K5X8qYqjirFG7G7zHEUl0WlP7AXH6WKd25FIkWnsoVO2EVSKnLz00
         cySXBjsWZH+ojLK4RO4Go0jIfQLhViizKMgrw7iedbnxtAmVQ/Q6jb2C0c01/zvxzXvy
         wn+nvf8DaJO80l1KDAr8fd2gfR03wsTxq+HsCK4F0lCGUldbhhUwiOlXJMQeA/hHGdef
         nBMfE2xU+0icOdiVFh0H5GU9o5OLAaub9zBifWrL4kJxwbxl65fvFtMVPJxaSnjTNPyp
         Pk5WVWillZDN1dfSfq/aba/77q+c1OEUeM0I3FVl2BRo6F7PyaiA6fzGF9DVBPHfe9tg
         ej+g==
X-Forwarded-Encrypted: i=1; AJvYcCUKoWsi7xxd3/xz6thpa1GPJQew7jajU7hWRyUcszVg7izrXrjSZCPLue9JDUZSmk5tnFGayumu13g6ISrWjSdj0W40LR/EFBWF7A==
X-Gm-Message-State: AOJu0Ywz/ZcayGKXTSSHBWahEmb4Fnh5XYayLWmEtrzQtpowZdjaS74A
	SPirWW/YSfdQZz+mok1lPV5OtbdGfA5vUKL+eDGm6ra5vdR1DgMIWCUaUK6ZSEbv1ngwMQgyJg4
	X0w==
X-Google-Smtp-Source: AGHT+IFR+iUgu+QKJU7dkP2vun0rHsyzYS+V01y7jiTTuZQWqm44psgY1ZYc8q2GM5amzUuj4CJmeyx9mEs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:314a:b0:2cf:6730:9342 with SMTP id
 98e67ed59e1d1-2cff93d3415mr54282a91.1.1722535072537; Thu, 01 Aug 2024
 10:57:52 -0700 (PDT)
Date: Thu, 1 Aug 2024 10:57:51 -0700
In-Reply-To: <20240801173955.1975034-1-ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240501085210.2213060-3-michael.roth@amd.com> <20240801173955.1975034-1-ackerleytng@google.com>
Message-ID: <ZqvMnz8203fJYr5L@google.com>
Subject: Re: [PATCH] Fixes: f32fb32820b1 ("KVM: x86: Add hook for determining
 max NPT mapping level")
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: michael.roth@amd.com, ak@linux.intel.com, alpergun@google.com, 
	ardb@kernel.org, ashish.kalra@amd.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, dovmurik@linux.ibm.com, hpa@zytor.com, 
	jarkko@kernel.org, jmattson@google.com, vannapurve@google.com, 
	erdemaktas@google.com, jroedel@suse.de, kirill@shutemov.name, 
	kvm@vger.kernel.org, liam.merwick@oracle.com, linux-coco@lists.linux.dev, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mingo@redhat.com, 
	nikunj.dadhania@amd.com, pankaj.gupta@amd.com, pbonzini@redhat.com, 
	peterz@infradead.org, pgonda@google.com, rientjes@google.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, slp@redhat.com, 
	srinivas.pandruvada@linux.intel.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, tobin@ibm.com, tony.luck@intel.com, vbabka@suse.cz, 
	vkuznets@redhat.com, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Aug 01, 2024, Ackerley Tng wrote:
> The `if (req_max_level)` test was meant ignore req_max_level if
> PG_LEVEL_NONE was returned. Hence, this function should return
> max_level instead of the ignored req_max_level.
> 

Fixes: ?

> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Change-Id: I403898aacc379ed98ba5caa41c9f1c52f277adc2

Bad gerrit, bad!
