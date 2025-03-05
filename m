Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42069250C1D
	for <linux-coco@lists.linux.dev>; Wed,  5 Mar 2025 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201353; cv=none; b=NV0XfhuRKZxNYVN3s6y5/OmjAseoim4oRRHhW1a5bO8IXQagyrGRxhkOHpQqbGn7wPrMGvGRfzVOv/5FZHUs3KBwNwABiifmzcge5HV9m+Hxq7ZeJ1Oqh2kmXBd5NLuDKU8GBRuYvbFi+6WXi+Wwo2/EnkIBnIswF82F633Teok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201353; c=relaxed/simple;
	bh=PImNvEb9R7mU674MFRkVo7MQticSDFJlq5WrSF4+QLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tzu+FI0b0s49qZNw+39qlFgLZSNilB89dHS9PZzhwy6lY7IH7zD+ag18YDt/TESHuaLfoIK5K3PEHg33iQDptVAATzNOasUPXKct0lPQVepgdXEsEx9Mkmx0Q18bRTK1eG3hhGNO4UsqF9/XO+AaftwrsxyGot4Edo4lV4AX1Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=dl8nRq+e; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dl8nRq+e"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so47462006d6.1
        for <linux-coco@lists.linux.dev>; Wed, 05 Mar 2025 11:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1741201351; x=1741806151; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PImNvEb9R7mU674MFRkVo7MQticSDFJlq5WrSF4+QLo=;
        b=dl8nRq+eJgsyO/LfaoOj+Jrte/mzHNMLoUyBYdLc93dlRqTUlv0/BhnyuqwQMEwy70
         FPSLWaP2iGnnFBtqUtaIWCfHQ9/q2NUIx7vxhb15b1nxM0d2/cNHulCX5Jhcbl7dna0M
         9AQEENu0Hi2ROugZN0X3s1K2EEfjqulKPZMxmXN7J2MaoivKNWoBcVPNcBJT6NcyrLKc
         BD/xFLLCNoYi4bOCSRSYHLVoPmQl/xr1BTdHTE4dGqQX57JiW4kJAWpdBovFBhQl311C
         L1krYNhVXMPq9WGVWKi/Dft5bqvTewGxUFoX8A+ElstxMMCfzR91Vp2bJiEQxSAG+O57
         ZI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201351; x=1741806151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PImNvEb9R7mU674MFRkVo7MQticSDFJlq5WrSF4+QLo=;
        b=OuqInAEUC+P1K6iR4Gs0JOgKTXNgxaSjEO71hyae5yawybNAYUmL5lcj54vtEnBKzs
         2F25/oUexLXD8PDvc0QRbymv3h2t5vNJ8tXeRg8l9TtTgBYv9tWNc1jFMt62aO1D2TT3
         Qzqhq2lsGaKkREJsrMJL5ylS+PVMOYMIZIPLsr5rF/FDfM1D3KC4KU0uMw8izjymiNL4
         nIdJMeECKJ1OZOB8j5JJctlQocuh/xOmdWknkOY3A6TsUmaT9MGl8frZ50G9Oyu0DFeK
         XC60tP3RSqhrJJRkmrs5MKFAXl6K/dWe7ZPUT3Rtn6jje7JhrOKWOl9vZiMZdTEIZczC
         84tg==
X-Forwarded-Encrypted: i=1; AJvYcCUuJeWLhayrfu8592wlmBRUgjyEsgZci+0DL1sxtkYzsUsHoUoA3eQWUUMj7Khk9VOyzdVv8DkNPbK+@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf26OhskkrizWYZX+w9hGAzV5b/Q6Q56nYWyw8FZ17YuUGT7FY
	gApeVpGhEQqqiHSuXtwqSNvlmNzPngjDeyOStvD3VSRl768zvAECvdGDbXol1JM=
X-Gm-Gg: ASbGncvxyJVALCvEXOqll99LYhmVvX6KyOOY9omskH/2EwlG6NjMwdRo21hkpGyZ0D7
	Sh6aP27eDR6cKlcad8UHCZOReuW51cM0MFC+8adqkkDzhaPsL12f8SVeHge6ZzhSznWwlVP/iLw
	aU3VWkmL9uajbNIyBTLqCar6gGuFcC1v5hEJrUFe32QBqj9egEn26fVX11INtw5Krun5Xw7UAMC
	8v5bZpYspO11CA0aHAUOEMgirKIuWBiCMp7RwCpfK4Yi60bNUH5JVH4Kl0UG3ucNl8tnGZDx7jp
	CldW/kdCXr7GOPp+vmXGmdvpVjxmxL0JX2NyztpYYGWQDT3uyuaKrUYJSYMg3HA6/HV8sM+j4Oa
	hxel6zFteLE+b4orQ8Q==
X-Google-Smtp-Source: AGHT+IFj/qwQTwKG8SNNtgVxRj9GZyBrMpWQIs1ECNvXkzZ0QEhM4dpXu10vspXzdcAPMQORADqmUA==
X-Received: by 2002:a05:6214:c48:b0:6e8:952a:240 with SMTP id 6a1803df08f44-6e8e6d1366emr58222716d6.32.1741201351058;
        Wed, 05 Mar 2025 11:02:31 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8e885f85csm11121396d6.100.2025.03.05.11.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:02:30 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tpu0j-00000001Ucp-3R2H;
	Wed, 05 Mar 2025 15:02:29 -0400
Date: Wed, 5 Mar 2025 15:02:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>, linux-coco@lists.linux.dev,
	Dionna Glaze <dionnaglaze@google.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 3/6] tpm: add send_recv() ops in tpm_class_ops
Message-ID: <20250305190229.GC354403@ziepe.ca>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-4-sgarzare@redhat.com>
 <Z8Jmps6AF_geaHUw@kernel.org>
 <3p5erujbhxw7ozdnfpmresv3dqdh2xszolv6mh4khkagoy3wit@ow5qht4keh4h>
 <0e156883acf95d31b9358831550d6d675e3ce4ff.camel@kernel.org>
 <Z8dg46Mj81Q9Z0WV@kernel.org>
 <jkr5z4thb55gs2jcmtcfipgg6p7z6ikhr6etd6l3nqpf723hf7@3fns3z5cjqk4>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jkr5z4thb55gs2jcmtcfipgg6p7z6ikhr6etd6l3nqpf723hf7@3fns3z5cjqk4>

On Wed, Mar 05, 2025 at 10:04:25AM +0100, Stefano Garzarella wrote:
> Jason suggested the send_recv() ops [2], which I liked, but if you prefer to
> avoid that, I can restore what we did in v1 and replace the
> TPM_CHIP_FLAG_IRQ hack with your point 2 (or use TPM_CHIP_FLAG_IRQ if you
> think it is fine).

I think it is a pretty notable simplification for the driver as it
does not need to implement send, status, req_canceled and more ops.

Given the small LOC on the core side I'd call that simplification a
win..

Jason
