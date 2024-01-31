Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6674F1F1
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 07:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706686099; cv=none; b=GWZiI7swy/zMdLzpTJKxcfKAcaQPECHRSa9tHrrf2CEm6JYT81xiL6Lj4N8D/JVxceTqjL8+IJZvtIlRXGbtqzuVe5Ma+TvJ+o+mnJmSqnr7yZf/XKvCWoYgB2F6oSLqhuR8Tp+RBl3aX/TyfKteTncwkh/EFVVtYWCQ7l7l4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706686099; c=relaxed/simple;
	bh=T5+zisAIGHvn0NxQUo47/5KKlNOyu1u0YiNiKyZ916U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tke5qFxsWjTbvfx8QKaFq6BZSZGWobjBvEJUbwUfcpJlpL73l14Y8Sul60Hbapi94sG+/AMorYGP9sFDEfYrgSutdTuJbqeAneXnOdNjjA7V39C1YDRdTgmKO8dzKv1yjTnbrPjq74orio5aYLQC9AIb6hIlMHNnfXpHfVXSrVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H0mdvF28; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H0mdvF28"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a366ad7ad45so47830566b.3
        for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 23:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706686095; x=1707290895; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5Yt/QXjH7m5U749SoJQH34aVlxAmq680N06m6SJ+dw=;
        b=H0mdvF28f2h0M8dhTNyuYi/we9do50erLkZp5rYS11F2Z8jiBLYUpovermnucESkC3
         r/tL+fNawrYCG9v5A+7Xoa1osUizqs/WAfPkjBEKwgp9/mbnEenWaocHhnBEZ4cWEVQr
         gliou5KeSQGwN+taT4Yf9ikG9tzLdd6aEKwFpvOu6Rb6YsnR7dayRZ4SIv28zThR3f1E
         2XMKX5/ErUriABl2aVfnaBfBedG0D32+bpQ6HjIbeGuc23+UD1SeArIk6H4q1/++PfXH
         OcJ/9Q+6Kr3XrFgeuEi3hL+u6JprqPFXd+yF7DprzeKvzNGqEo71ySV3RXpevC1xoBdO
         3i4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706686095; x=1707290895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5Yt/QXjH7m5U749SoJQH34aVlxAmq680N06m6SJ+dw=;
        b=m0pAZ6qGWx16woYkqdXqDTc/2lqbvrIVfPAqnCPfBTleU8EAAax5MwlSaTx56vYTIJ
         b5vRDh605Ud9cLgwUR17dsKf9zpa2oJHBsQKPT8vcS7g4u9tOF27YogBUpEdNe37J9fO
         AbLprYGPqRR1tRmLVVtQqdo+soA2vuNXg9NNKFMUomubU7Njf2ZXAScdYbN1gWsc9/Ld
         mFU4SGMWa/PPy7k2bsyTTp4fDVG9UllNy50DX/jTuIzs9Yi8ctSuBxxekIqBudq2EbEg
         2CEzI74YfCC4X/FOFeQ83Ucx+quybPGtd4CB83+F4OuItj9q0cExrGer8Y1zvw7Lnu71
         PnpQ==
X-Gm-Message-State: AOJu0Ywcuk8wpM1x0es7PenzYE1vAHNrIa77M7unI05BV+5mSf3g4kMI
	OTjpJQPg671XAVvH/ByicX+mMeQPSUlytTjOvwJ8M+aVX7sNIuTKRVTNuA6scTE4DG3hjtuEOj1
	2
X-Google-Smtp-Source: AGHT+IEe8hbIfZOPqsC92klg4LSNJWG/3wlv/kn+m0tz7W1HNt0KATZgGWlcez6x2p1z0yJqgqlJxQ==
X-Received: by 2002:a17:906:d88:b0:a35:46d8:53ce with SMTP id m8-20020a1709060d8800b00a3546d853cemr515011eji.18.1706686095010;
        Tue, 30 Jan 2024 23:28:15 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:7588:aea0:a2ac:ddc1:371f? ([2a10:bac0:b000:7588:aea0:a2ac:ddc1:371f])
        by smtp.gmail.com with ESMTPSA id tj7-20020a170907c24700b00a368cb76c70sm9323ejc.16.2024.01.30.23.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 23:28:14 -0800 (PST)
Message-ID: <e3078be1-397a-4927-966a-acea5561eec8@suse.com>
Date: Wed, 31 Jan 2024 09:28:13 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Content-Language: en-US
To: linux-coco@lists.linux.dev
Cc: x86@kernel.org, dave.hansen@linux.intel.com, dan.j.williams@intel.com,
 dionnaglaze@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
References: <20240124093858.1818497-1-nik.borisov@suse.com>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20240124093858.1818497-1-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.01.24 г. 11:38 ч., Nikolay Borisov wrote:
> IOCTL based interface was the natural choice for interacting with the
> quote generation machine at a time when there wasn't anything better.
> Fortunately, now we have a vendor-agnostic, configfs-based one which
> obviates the need to have the IOCTL-based interface.
> 
> Gate the relevant code behind a Kconfig option, clearly marking it as
> deprecated as well as introduce a runtime warning.
> 
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>

Ping?
