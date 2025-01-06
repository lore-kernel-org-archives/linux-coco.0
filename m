Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223478F4F
	for <linux-coco@lists.linux.dev>; Mon,  6 Jan 2025 17:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736183888; cv=none; b=FX3TqFTEw0nPveVRYMRIm2e/tUcwtlRlrxEH8OROpnfZZiHQfcvmVrq6BnC+3Z9li+Yp82ObyepPa97K9IOQ9/CviRDI21BVv5lQ3RUHv3fIvMV79saJedj29jZTXL4POKXzgrRmPLHG2kLceIbNYSzkaLA0868nSBsq9sxjqjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736183888; c=relaxed/simple;
	bh=qXFqgqxAqyUeWVPBcafW/WpP7kiQQk/e+qd5C+KpIfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maurJGqVgXzHmqgwyDjMVAysajK3PIvtpTy5I98XTclHnNYPrzIVes/hGc0nzSo9MHtib8J/5HFPCxo4ZG9qpk6H57DRxKBVb7bgGvObuwgW8j53aZ+TK5oyOWydnD8P0uDFeDhuJTZxmm1UM0t+lAwqn4ioiynFfo6HB2RNttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xJyXl/zY; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xJyXl/zY"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa67ac42819so2103412966b.0
        for <linux-coco@lists.linux.dev>; Mon, 06 Jan 2025 09:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736183885; x=1736788685; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXFqgqxAqyUeWVPBcafW/WpP7kiQQk/e+qd5C+KpIfU=;
        b=xJyXl/zYV/0f8CIDaiOs6YO0sxjuuVRGIWcv9sy7zwRYGoGM9vrTOuqbicXm280T4O
         9fqSAlb28CW4Pz9d7KqrNxmH1SRW95TV9Jfrfx7jOMUeftHT8WwvTya7kp9k68AsdZAv
         SmrobkLdNf2ej9PH0CaYz9xW1iF/2N0RtTnsT/HM2F0cyOjWNPcbbPW/mGl32A4sQ6i7
         zGuyXvBgcp4SUoMcBEEiSS6jLW21tdxEXAQy3zwor4LFDVgYyZpQLj4LcnJIQJbX5jil
         J9Nk5jwnu7Ys2ufzHUVp7YsRs0YpYBk8ddd+vuqL2hYQQbEYWaxH8cejQjw7lH88s27V
         qkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736183885; x=1736788685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXFqgqxAqyUeWVPBcafW/WpP7kiQQk/e+qd5C+KpIfU=;
        b=EN4K8YkuKqk6VNIFm9Jhijl8Zv8DazyTtfFUBRIBIbRwhS3VoA75HRvsb4702aJ7zU
         JD86HT/J8NYd8WfLXLhlujoxtVMeS3xOoS+iMXc5XfJpJgHtw8MWEAbpw9garNwhlTxG
         Bh5SYjPlxXBuvf9X5zIFA6W8LZS38Bqmg7W9I37jX+qpH3DsY2cCepHicm+2QGt5KNsq
         e/uQnVY1dB23QpWrrhs2AZPS7ueXlt1Ponziu/mFjI1aW662Wyfp5Id+UytaAMl5C+T1
         SZjOOmbUFgc7Q/R84nnmEKWPHlzW7VkQ85ix78jUQ6GQTuHayMXcSe2pdgZRUYZH7VGX
         wqpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+zUkkYXv8wM6GhMeLhSGq/Z4nBNA4e7ADNp2lmMn4ruYErXcuLUTfhTX9tiMa5nOLizvXnjWmKdSu@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp6vCGfNtS8WAp+KvZ0f5DgdYWosbqpaWiIV6fnjwemGLWgaNa
	MXEVVX0gqSu5gSEYodMH+zJxS8n0PLHcUQnbyk2KzwF0oJ2aWQh+iLNHv5zr7qBqBQjBCqM70G5
	m60SyYVqomNW1A89liG3ZfLuYTwxLcqNogiqg
X-Gm-Gg: ASbGncsiPwusOmWLue8+7GBtmc4WGjYt13UzUX/rHcI3VTsYzfbiO2HzLePqkcumDHD
	2Krz17gl9Zcqv+LNYhp2CJAFlDGi5CSaADotzILsnZgukIBnYgwv/mIZRqAVXpuezhQVCPNCo
X-Google-Smtp-Source: AGHT+IH4zhvWlbTKOD8lvP8RMMKJA0yWR5I3TDvRZlab6xY+9KB36ULJffWZ6mcFIjwUzAEqY3NRwnlWiKUO7EH3Sjg=
X-Received: by 2002:a17:907:96ac:b0:aa6:59ee:1a19 with SMTP id
 a640c23a62f3a-aac348c4720mr4648129566b.60.1736183884594; Mon, 06 Jan 2025
 09:18:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1735931639.git.ashish.kalra@amd.com> <707efae1123d13115bd8517324b58c763e9377d8.1735931639.git.ashish.kalra@amd.com>
In-Reply-To: <707efae1123d13115bd8517324b58c763e9377d8.1735931639.git.ashish.kalra@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 6 Jan 2025 09:17:53 -0800
X-Gm-Features: AbW1kvYrCxcJi7iB4tiG8Ua04Oabv3b6MoW0bEbHV4EKkOFCLYtAjLUDnY9Vig8
Message-ID: <CAAH4kHb6-us9a-GZhXEs2Ah0aQp5YwSniHVvJ=QtuiJF5LTrAA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] crypto: ccp: Move dev_info/err messages for
 SEV/SNP initialization
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, michael.roth@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 11:59=E2=80=AFAM Ashish Kalra <Ashish.Kalra@amd.com>=
 wrote:
>
> From: Ashish Kalra <ashish.kalra@amd.com>
>
> Remove dev_info and dev_err messages related to SEV/SNP initialization

I don't see any "remove" code in this patch.



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
