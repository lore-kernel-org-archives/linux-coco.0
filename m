Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68EC13C8E1
	for <linux-coco@lists.linux.dev>; Thu,  1 Aug 2024 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722535219; cv=none; b=MOL0EIgTKHEHl6YWL3woWNrLc3EBYHsnnSjFFDpm49eeBQG+LjhQy9Ffds/sJVUSE1SB3BUiuaZBVCsJuy0wJIFajHXXeP7xC2Y5/NbMizqGHS5yNTUJei9Dxw2pRH7r7Lr71GtlW/H70KLIuaVv149DEX8LKV6rnW9eHJ6l3aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722535219; c=relaxed/simple;
	bh=jhGbP7nHvLdw8c3N8ItR7ROW4JPxGIcyfk2Yqpfr4Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXjpbf+YYVDpvK6tLS+NNJvHNhjTXW+RRYZQwKVbh2pSNo7ilCVljcBIlHcXvVKLL4D5fbHgX+bjhu4gWDm3pgNlVqa1sV0MJdpWa8RBiMPLcOkR3lIekYIv2BvkjezbSXaaWg8mBYBwqpoAGQgOMzU/XtL1Bi9lJdZ3phmQN8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Pm4orEO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Pm4orEO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7ad02501c3so38593866b.2
        for <linux-coco@lists.linux.dev>; Thu, 01 Aug 2024 11:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722535214; x=1723140014; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhGbP7nHvLdw8c3N8ItR7ROW4JPxGIcyfk2Yqpfr4Sw=;
        b=3Pm4orEOMrdWngKQ3x+gVtiHHI0FjvkhsE6FFf+IrV3XxUbCpFqJVy575CWQjWDgJe
         IndpBeS80cq5sOL2NY9KNdk9Ksf66qG/FzWntsY8wEBFsM5i3bEUuucfAgFPQSRAsv8S
         77Hg7Y3knCkch5MVZgUyq0Vt9iPiTcYujCWNqeYDUjsUuQjIocdJR8TWps6qLZLO8Pnb
         HZpT5OsrvMMyz1yskAI7Jpn6IKfI9DjlHUPrM8xHVZjwrrDJUHMBC67qlnd1q2iRF+lE
         oMC9iz0XF8Z+ppzX7B1MfWobWD2JQ4I7s0cYKIxeCYaitjs9x0DGT9ffp9fB+CUinDfF
         qlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722535214; x=1723140014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhGbP7nHvLdw8c3N8ItR7ROW4JPxGIcyfk2Yqpfr4Sw=;
        b=Ay4aBH0I8cF+JpN9i8zeTApUpcevdNifgziGCnN3Rea63hHo3KT+ibL/vI3Dcovs+p
         hmiKN8ze1TmDv7OttqVzCl3/fWcBtUt1/pj0EMYB1bLrGRyLOvILEmM85SoD+74wOuS8
         nxCS5H4PJOQyibT7otbfC6H1f/IYQI8HF8ypAnp3YKAYqOBzI5WRhXkmU6isXfazsuor
         FuwOuxOeaXgW21dd1XBN6rq/lyZGd5T5piVK6dk2XsPR+Zi7fYLRwRokOT7ADCwHfDi9
         brtz3YdtQNKvWWCpyFu4CkXpfPSG0UTQeGB/6HpkNf2WGadtsP4uELZQjiHlYTUT9efV
         qkTA==
X-Forwarded-Encrypted: i=1; AJvYcCXJIjgJanh9L5yzsxJADfXmjyArGVThjKkGwTOXUCtPOKnN98F88BPqL7U6EoQtUf4dS5BtdQwOpm3spm0qOttaxPrIpAYBlkW3Vg==
X-Gm-Message-State: AOJu0YybJCFSHPtIC6EvZj8dOjgrnMGpvDEosMX1caH+koidT5Yt6NlU
	kwCyf5pMGi24A+s8XjqS/Y4vrxAq4wy0Pq3h+YCr/1VUByWOBbj0jCN92jZDhYefFauHcr+HZPb
	17+eC43eGZJ5HLmyJmT7hv9MDFFfp4/RncaJY
X-Google-Smtp-Source: AGHT+IFE0cLdxL3ym8WvsUt9Le3O2EWwnFz8MqEAbRvWcP10izGVT6YQWPv3mZsvMOJaaXqsRYFpmW2RSv8fqGG8Ilw=
X-Received: by 2002:a17:907:3f0b:b0:a7a:a2b7:93ff with SMTP id
 a640c23a62f3a-a7dc51bd262mr73976866b.57.1722535213273; Thu, 01 Aug 2024
 11:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501085210.2213060-3-michael.roth@amd.com>
 <20240801173955.1975034-1-ackerleytng@google.com> <ZqvMnz8203fJYr5L@google.com>
In-Reply-To: <ZqvMnz8203fJYr5L@google.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 1 Aug 2024 10:59:35 -0700
Message-ID: <CAJD7tkZM8o=B5mGedFpqNL46RRNdmq8FcTVXzS78BrHjGHBzEA@mail.gmail.com>
Subject: Re: [PATCH] Fixes: f32fb32820b1 ("KVM: x86: Add hook for determining
 max NPT mapping level")
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, michael.roth@amd.com, ak@linux.intel.com, 
	alpergun@google.com, ardb@kernel.org, ashish.kalra@amd.com, bp@alien8.de, 
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 10:58=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Aug 01, 2024, Ackerley Tng wrote:
> > The `if (req_max_level)` test was meant ignore req_max_level if
> > PG_LEVEL_NONE was returned. Hence, this function should return
> > max_level instead of the ignored req_max_level.
> >
>
> Fixes: ?

I think it's in the subject :)

>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Change-Id: I403898aacc379ed98ba5caa41c9f1c52f277adc2
>
> Bad gerrit, bad!
>
