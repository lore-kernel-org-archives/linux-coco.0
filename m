Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560995;
	b=gitViazw/Vqn9zr5SLM/ZSqOlCee0u7KrUIpG9K9TqoeToDpgffJcORUYfmdWS4s0J3U
	 Z5r+Sg9BX5rEiw+3I5ykLWf28qyLgtuDR7yvNiWlTZdHCk795AVM+GxbjFAGWzzEEFctB
	 8cqo480haEBHBeTBE9FyaRxUEJZZDRFSp4WFGOuuJVTZNxJszwOjqejHLlZdQK0o6Rh3p
	 vG9OrtrHEY3uieNZKczQZ71GkONtQEfDs7sAZu3rFtQoGPdbA5R1uMR+gLGGDluVIDSfK
	 477NRtOy9a8mljkx9TfSztgd0691kt7E46G4SkDay52mSohchT6diLXGhxYLLZxwamw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=guR2kn0I9WVyI0WwVW8m8P4IC07cc5z6OUtXdezJXW0=;
	b=VrGf43ikAbiSJdjXvgP/iWxyxYV3CTvia5L3YXYvAKDJSghTIluo/BRY7ML3Y53BdprK
	 jIERT2MAIIjlrGVbc8OjeLPkJ0B1gphz/agZae5dBXJdJr63oC0T64yYK87MyqxX9Blws
	 aLmBGZDvtrT/7yVvCWuZe6exq9WaePHEarh81qaQkQBPllMWQBQpecTL9+mlV7jDEpjPE
	 mBJC3WlcJk6O1VoYspDftUkkKC29L+Y2jQPfMvkorowjGmw2UjW6/J01ksfhpH+/Q6DWd
	 LpRdqrnY5lu8acGT+qvIuZdsq710InkVjReGd6+EIRjevDzXFSB5EZ/SxnwSVDRmoPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=VXJdAQT4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A37606A32A
	for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 09:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A37606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=VXJdAQT4
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-451a49abd8aso1196043fac.3
        for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 01:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794560993; cv=none;
        d=google.com; s=arc-20260327;
        b=U4eIa/KUktCHGUL2IR39NeWprcHhn34tvN4lCekI8FA++3BCSx7kN0p8ll6IPcjexM
         tPGN5RhH++lk4bxUWCVTq1q+irUs9bLg9M+z4XpmlmSSxyZupinCq5FOb/2CCqUdx5zx
         SU6TIewSZDN9lHInE0qpz88vMKuPcDMkdHRh+foWsbzrUc4P/cr9vEBKDWW71FhAyfyb
         8mt6y7x3sDVlRhdrLaB4mAJh2UEyFVzub5/JXWlR/mIZiSn8iB8X+Ba8SJsp83RAE8w+
         6TmM+lQlBbmnSiqiLy4jXZAIL85tYTI2VFQrZ3Dsxq0bsULHoxZef1HhuipBdZUWdyip
         oFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=guR2kn0I9WVyI0WwVW8m8P4IC07cc5z6OUtXdezJXW0=;
        fh=M9THYZZ49yDl9K+uwebjYfNcoGCOQn4AWyopo4Vuvu0=;
        b=TtBUKNim0bXbrpipqZSpJe1BSP6bsaQVELPSm6cuxX8QffHbkCKNxl5PZ6DMs51yFe
         Gfwk+nWbIL0+1LDhAeSEEFsMsXY0is3CDdEEcnNUdUYLtmxx/r7aPE+0jMzsPGL2FzVZ
         wTH6SaL1+ocFCzskXsKSH0m61Af7//Kq3B8hycTkE73WLfsRDIRd4NGOuaoB9HJUoXf1
         aaslT4u7VnDLPdQm9RzJ8uRgGj0I8/kgHG4j7F8P1C6Yv25TxQmiBi1Bh5A4FlNgvvfA
         Ymv9zOiekNL3yotCpm6dQHd+Nd+CXVWoeUHLHC9kNf1mmZGiXUAA2SlcvaZKWGa3mRar
         IKow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1794560993; x=1795165793; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guR2kn0I9WVyI0WwVW8m8P4IC07cc5z6OUtXdezJXW0=;
        b=VXJdAQT4+HK6pFwBtMJQITZU7nfmW3SM+4rnF/ZoWb18SXjxeZg7psggsDgQKdSZtP
         9/ctEQe6mA1hFhy7jKYr2SuJKGCq93yZx7y98VUat9d846nrVQpNvHkAvySBOSoZ3Tpo
         5By+ESYSDcoqcwzjZutKq7PcnPIo5CNa4NiPj+u7SP2X173AKPjILZjuPIS6g50LogYJ
         4vyQTD43FkrKS/hHzuUKNKU0lFSykQT5Glsf3vCy2D4qGfm3x8JUJvRLeAeZDP4aY7Qf
         KDBZBNPIpyTVMD3CqbfwcujvClj60OIVfBnDgYmW8BHHAE7idozr8mI4QrzVoYD/PJ4X
         kDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560993; x=1795165793;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guR2kn0I9WVyI0WwVW8m8P4IC07cc5z6OUtXdezJXW0=;
        b=DP/Y75zDfrwWh0Gmpg18RM14TIOwhqV7Ol3rnnkbxNY+AnStG4J51eHalcGOWvaxx/
         xyznrPyhu45qM86mxxxovBFrDhsAz+T9HMMw81M/NIwbjsfsteqXUPrz+2v4dabVrerw
         9R4rBD0WaZzDJ8iNcG51jx5XxUDDA0y3Tpefsxr1iDuXCYOIq1Ovl/G/Qfe48YqZ5mx0
         J79Oj1NFhWnFigqjT4lgprcpwaEiYvjM+68wiQ+grRlaco/FhsasV8MxddE+y7mVRK2Y
         zx2cWstd08VPRRmD8kWS5KYx44FlOxk1KikJaFBMd0//pKcZNenC+LzYoflYiC3twimU
         Mntg==
X-Forwarded-Encrypted: i=1; AL+hErEwzSuNtpa+0CHjRonJv9pYF+39ovxYCxHLAoikboJdorBYYQmZGOXUcqYmpq1tH6TzPxadJUBaHIjt@lists.linux.dev
X-Gm-Message-State: APuU4Z+SLd+t/CGmVxDLHSrnTtVTJlXuvGOFsqyctQSmk5zveAHT5hse
	j+v4bJWcaY1fnbTctdJE52OPS97SY+Ko9PXrk6pLWJaditjyzwJMXtHLKgFeKZmYcMpZSdagRWB
	CKBIbNzFcl7AJSmKrj4q65v46lZWncXASI3zBLO7eUQ==
X-Gm-Gg: AYBFou2piDqPhhQDBJhqnQ5p133MyOVlGBy45EPk+DZHxhBgkOazdvS0rm28PVxggze
	n6fjHmH8Fl7xe4I4uISn32LwO85CnbYTzdfz9XJkhI4kmJChmifUacOoqhjfPZYZJmsJ4IZES8J
	unm+O2L5W6Yp22av8H8h0uf7lCUabcARD6WEdW9u/JCXq+dVraaV+h8gH4xlmx52XIz+q/7942S
	08ZWp4mcFLIy40iIZuZsSgIH4N15Ij1DOmdjRAF9KkLp1VFaoMWTy+tGohHeGp2ffvcqes6GACb
	Lj0QKtA7MjUWLxa9NxuZvr0EQ/OTDWgHZ0komT4BG3zA0ZAkjCvRauBbWQs+aqJsEA0WNDl6HYC
	PQQ47VACZA1EkEV/Ef60LH6PyqrrqdUJON0ZDtnqdU3WFPnpl/2e+H0w1lmh27pwfrG4UEPFlXu
	4bZ4sq+2G4XSInmTqU9EPSuALn62TrnFtMVJlZ7ISwk7amLL+tgd1HmOG68AbEQENeiINxgIFPF
	w==
X-Received: by 2002:a05:6870:e135:b0:43b:b245:30ac with SMTP id
 586e51a60fabf-4afdf492b47mr2095487fac.16.1794560993407; Fri, 13 Nov 2026
 01:09:53 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-tdx-guest-quote-poll-v3-0-6a83bb767314@flashbots.net>
 <3b582cdcfe37f1d01ee71611ab2611f845261089.camel@intel.com> <CAKV3HMM9BKpmgWeFqRqamAsqqiofj+TG4DrOEHmbUyE0FjA7+w@mail.gmail.com>
In-Reply-To: <CAKV3HMM9BKpmgWeFqRqamAsqqiofj+TG4DrOEHmbUyE0FjA7+w@mail.gmail.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Fri, 13 Nov 2026 09:09:41 +0000
X-Gm-Features: AclHuK8gjoF7QTD6gz3W2dlc8aBwAvH7LfNyoPplzwlNGb-GET7hpsX60d1d4kI
Message-ID: <CAKV3HMOnY9LXvtFjnNKzfhVwxf7v-ZqDrRfceyLeVLP82x=bnQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v3_0=2F2=5D_virt=3A_tdx=2Dguest=3A_Fi?=
	=?UTF-8?Q?x_and_speed_up_the_wait_for_a_Quote?=
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"djbw@kernel.org" <djbw@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Miao, Jun" <jun.miao@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

This is a gentle reminder; it has been 10 days since my last reply
without feedback. Do you have any thoughts on it?
Kind regards
