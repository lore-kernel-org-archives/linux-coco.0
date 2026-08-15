Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5518C376A01
	for <linux-coco@lists.linux.dev>; Sat, 15 Aug 2026 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786793992; cv=none; b=kKAfO+5dUC4EwyOYG/RNTMjNFVV6otHTZ4DhItABSNaBgQmLqv6hl6Pahs1KwOiESJ40y6BVIslXA31ZhDz3dZa0ikLn6ZHhwq4a/70rFei6ZaAL33ZJuqfRmFd+uhelEpMW3Dh0Nzj6uyb3heCL1oaCXIEy074POg8TOeEPRyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786793992; c=relaxed/simple;
	bh=IR0YYfxxWEISJzS6djOa3HjOjfoYQWVxSn+BVN0rc0c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VPeFnS5haQdm1Lp+qVFuFdD9b67amGx82SXnslDWTgPJaKB/Q0JFYqVDkmX0P6IJeTY2kCkVJG5ImFMIU5gII20iMPloJPupsTGKrCGEcWeogSnv+WUUwjdaRibR2mmwbQOqZnsZq0n7PIHH7jUnPqJtwFuQFu0vhAEuBbPmCD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTpQ0sXA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTpQ0sXA"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1684981f8f.3
        for <linux-coco@lists.linux.dev>; Sat, 15 Aug 2026 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786793990; x=1787398790; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IR0YYfxxWEISJzS6djOa3HjOjfoYQWVxSn+BVN0rc0c=;
        b=fTpQ0sXAKvmZzzPXFl+8dVmo8n0WuLxJalp1CWnVo1awShWrPmfBTyiXchXgL3Kivn
         fSV3p8GLE3KIDIljSpk/qGDMO8oEBdKeYEG+DZw1ES5ZIl4HtNwaozWqTA5G89yp8sMs
         3oTrVWaexjkwSO45qQ5snn6QhLlH2T5woIbk8IXyQqGAA3krVpP9SZVo8XoLwxuGtIaw
         z6t9hm2bB0AWaLu4hludFeabu603LY7mSkPqaUl80FY7yqxAQ7VyXXVlzK4SJZrTSdaT
         PYuANXQ3HrDhRZhhkF89mIWYkXQuVtGpwK/vnhehv0UwEqrqumxvDg4nkT+3aXSUZCAk
         xjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786793990; x=1787398790;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IR0YYfxxWEISJzS6djOa3HjOjfoYQWVxSn+BVN0rc0c=;
        b=Xv41QCYIqJD07aNOrFJUHVKl25oR9XOSj+ZGgEjmPutaAXAaxwiFv6oIMeUNTC3Tox
         sL2HxciCwYO9thXK+1qHyJbQTGNPDcSW6px+qqtwIOcQ/21DL9H75b0B6fX0chqxoK5L
         wZIL4Y6MWxrcxegwpOd9YHZ/NAbeCvmF2rItf/6QgGG9YvJIfYLemrAPhGjriJOPNEif
         OFepG1m2bPZI5Ex5CMR0H7sIwUHgEjYj9HDXjMMnwVYQBprV5LEhwD5NdFmw/emAzB5G
         SsxRxoVDp8IAO6PXSILh+xnkgjMxD7KFVJMVrZiP6hYoEWGo6l7Hnb7dOJwvm+VvduGL
         PH6g==
X-Forwarded-Encrypted: i=1; AHgh+RouWGkw/MaF1y62wc9ABhSJXgp46dTC+IL3Uzu1llql1duz8N/rNfUEq9bw58I9yaWZzO6Flf0OvOhu@lists.linux.dev
X-Gm-Message-State: AOJu0YxOjaJ08wjrZjaXYgmAD0J6Bd8JXeOgBDkxEdpmJYjKjR6iSh1S
	0rMUgL7vkvzlT6FMr9/uNFzGCto58xGky/JbLdtCX0OsbjXIueK1f4Kj
X-Gm-Gg: AR+sD13FeJKRYNgaYq0LgNaEkp18wPusyUTaa/KpJxgYokcKiMGHSh0BeMlTDctMNqP
	YroNtwtN1cnAg+04OCgmmDQn0KMADdnKR24Z6DnPKH2DI+dVCjHwq6qAFyxkxz+gLxzc6SzhSvq
	YxgiH0dx0Uv9F6CKDQ+/D2sKpSMGSJfdUWZ7qr0Tx85ScU1TYeiaOdC5NKg2bnPwogTyJM25bQ1
	LO9wdqhhTxoxEaUQ62NjIW/y030wACJvs+REhG7G/dMCnEUbrgwIC1AQagPqSyYef43gZ0idOCw
	pMO66qXcxwPA7vjEpwbK8CAgu2QtwFxPkSaTFT9NC62oxMVG/RA3LLDQnUowXcYUQ5cg2ZcBWgi
	cSSyCThdlXfEknCRjw4XlTMYb4s/sAXZOLE5BFOmAkTGV6x6up/j3YUxUen7GW/hVPhhXKyYJs9
	H/RwuPb3iYXxIMvxNHvS7FhLlkAffD4kfk2PXTB//yfwMgLydnIiJLhOm7h3mZuEnmBWwajOa0
X-Received: by 2002:a7b:c348:0:b0:499:795a:c60b with SMTP id 5b1f17b1804b1-499879a3c5fmr131538805e9.19.1786793989489;
        Sat, 15 Aug 2026 04:39:49 -0700 (PDT)
Received: from [10.245.245.10] ([134.191.227.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2cc81csm16430398f8f.34.2026.08.15.04.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:39:48 -0700 (PDT)
Message-ID: <498af8d6a5de3ee05e0216ea075c0eebf88c7072.camel@gmail.com>
Subject: Re: [PATCH v3 0/4] tdx-guest: Make Quote buffer size dynamic
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "seanjc@google.com"
	 <seanjc@google.com>
Cc: "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com"
 <mingo@redhat.com>,  "x86@kernel.org"	 <x86@kernel.org>, "kas@kernel.org"
 <kas@kernel.org>,  "binbin.wu@linux.intel.com"	
 <binbin.wu@linux.intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"	
 <sathyanarayanan.kuppuswamy@linux.intel.com>, "dave.hansen@linux.intel.com"
	 <dave.hansen@linux.intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>,  "linux-coco@lists.linux.dev"	
 <linux-coco@lists.linux.dev>, "hpa@zytor.com" <hpa@zytor.com>,
 "bp@alien8.de"	 <bp@alien8.de>, "Fang, Peter" <peter.fang@intel.com>
Date: Sat, 15 Aug 2026 14:39:46 +0300
In-Reply-To: <21ffbb7b80c0c654c23a97cda55f43c73e49ba25.camel@intel.com>
References: <20260729122939.1340412-1-peter.fang@intel.com>
		 <e0a90fba3f8424412387aa08f1fdc708abeedc73.camel@intel.com>
		 <80b4ea89ebf17398c3bee21d157c7f97ea32aadf.camel@intel.com>
		 <anxvwV_Pz4UYaxxt@google.com>
		 <86d532f33816cd4fa3e29c40079a6003abf89324.camel@intel.com>
		 <anyiwqi9i0NSv0QW@google.com>
		 <ed4891a59096c59e43a893910c9f17d0ff6086b8.camel@intel.com>
		 <20260812223707.GD1013044@pedri>
		 <6191a69559e58e04c8e3f1efa776e9639796af3d.camel@intel.com>
		 <anz9b6CDkhr5D5RG@google.com>
		 <c697ff1d97fe62882eaf3bd86a4213bf2e79fc09.camel@intel.com>
		 <98dcc8a12f117745a1cb9981dc8f0f1548e9c96f.camel@gmail.com>
		 <4ad451969522eecb445289ca74a88ee73d51336d.camel@intel.com>
		 <8b432c8731167e97432b2e917d0b1c855fedf47c.camel@gmail.com>
	 <21ffbb7b80c0c654c23a97cda55f43c73e49ba25.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-08-14 at 15:55 +0000, Edgecombe, Rick P wrote:
> On Fri, 2026-08-14 at 08:45 +0300, Artem Bityutskiy wrote:
> > But why DICE-based attestation uses 2-flow design? Could TD run a
> > TDCALL[TDG.GET.QUOTE2] or something directly. No concept of TD report
> > would be needed. That would be my current vision of "cleanest".
>=20
> We discussed this approach internally and in PUCK. The problem is there i=
s a
> shared resource, and so something needs to handle locking and fairness be=
tween
> the guests. Going to the host keeps all the scheduling type stuff in that
> domain.

Good point. I did not think about this aspect.

I am curious if today this is an attestation-only problem or a pattern.
I mean this "many TDs compete for a shared TDX capability, VMM needs to
be involved to handle fairness".

Thanks, Artem.
