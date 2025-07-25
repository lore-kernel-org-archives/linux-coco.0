Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6F9205ABA
	for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753430735; cv=none; b=Cf0SF1zlgbv06+RiBp5WccmW+zFBSfwIaUpUvL2D+hP09XkdS3k/njRZw9I6uHF58DcvKFPz39gsT9Xwp2Nr71Ms8G2ORxO7DelZtoDpJuWKDkYBrPCJwVPhby+pXYgiARZlWyy8OGmUrIJOjSD6tuOW8Hu0A3KT2Au0NcBcxQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753430735; c=relaxed/simple;
	bh=ajTcppa1gSdeqNwkcD1rjRYogNHde5NOslHrwv9fGRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXkWqV//DWgr2nortyqrqK88P82nkJmd+lKMucVpJxeiGQXGy/ahDLfbZPrcTCFyROMG0luM0MgZP20gdEN77tfNtzb8zaguf+2A5swb5IbEGDhlUmce0FQyA9xE7NokjwMNxhK4oNCA+BnBQHplNIoFQkRAEdkSPcc6UU0IOI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0J+PyCx; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0J+PyCx"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so1649322a12.3
        for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 01:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753430733; x=1754035533; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajTcppa1gSdeqNwkcD1rjRYogNHde5NOslHrwv9fGRY=;
        b=O0J+PyCxXwcVazWgdfljUP9FajNdWfIZtXZ4FOhz73vxEIAdFAwY5KMuqGdPoN3mNr
         NSRYGnJG3viP1EJ2Qy7NKcekjWWbY/MZ2EDYK6L3rFbWLkzpGWFYf8+Arsilazk0Kkk4
         5n1YCqPBxF9iwLccDdwUbylhA1UG249RqEIWp1VJxfIbSj0UOhm+2vg6bf2gniQT5McK
         AZx4eTdPPW1T3M11fvuIGWfEWaGYfXHHCSu5PP23DV4sYs3yx/brmf7D1/ni1wZwKyIb
         ukYZMUfC4g/rNu2k3kT0uUjFarA1xTFTjKl8/Q+yWSxYG4aWCVEa5G6+VuFxjDOLeFNP
         2V7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753430733; x=1754035533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajTcppa1gSdeqNwkcD1rjRYogNHde5NOslHrwv9fGRY=;
        b=gaq3I9J1Q+R3EkjBpA3PxsJr7fYu6huUqkMwvEOIiq1zf0iDt2NQmC1hR6TDLPZC3m
         vockF8gzKvEvH00/B/MB8HorKk7CtGXhfE5ARYtcw4/yH0nr7e9eXdOHFzbtgnLj6jP1
         cwIBGx5i1oUx0RqCnX0YzsGX79yA+kdNzGvCpU+xO1tMfHCVFjhZzAsHBsCGXKG35W11
         89s99yy9pTpIHVY4gC4CDRF82KrvyjpTZN64WxWhmjWNniHoh1CWAW+hzNvajINWBZ+T
         JuOwVOf+7qVgD5kQTjgWIAZ0XlicTuTJlt37nPwLUEnDtYmG2/ilLk14iItuDGRDO+Jl
         +8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdBywwZ/Xn4TuvNNA3srqk995lUv8zl6RMZcWoUb2CjxlS45rrG1VdHDmpelHlKP1qsk8zGSZImHN4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4BepKeqXwoquqmJByEo3e1kp8AdjpIVIVP+zOfSymvIauDXQ7
	v2No2E/rIFZtrsSUdXrWOA8kCyIWjnYYq7gC4IhKj5R/V7b7dA3I+r8esSZAQk3814108e+4kX6
	XWkxPZtCuv3/OSZXIFuMqVmlwBp1A7EU=
X-Gm-Gg: ASbGncvAcMo1ngroEKrq6Hg/H9IWTCA90aCdlBsCj1vpU3UZyTJ7BqsmByec08QXBhU
	ebOrTCUb5djzZr6Yc6WN7TKPyy0MaHIr/hWkFaEBpkDiCdoeD+ow0zRTQ7ceWrDph2c3xp1U63+
	tDv9QNgUrBl+d/21xDm21PegUuhbOJXPjYpgaxrMiBVwKQTQ1s08pGyjkXuxJ6fNawdZci+zGl+
	62j
X-Google-Smtp-Source: AGHT+IH0N7juE1ML00NeiySrFmenoxzcFgUIXMma1ZSmVk4GmnlWp8/mq5UTyMmh53UW0+vZkWi5ZEkkBePcY/NEHCk=
X-Received: by 2002:a17:90b:2809:b0:311:fde5:c4be with SMTP id
 98e67ed59e1d1-31e77a1a3b7mr1399394a91.35.1753430733203; Fri, 25 Jul 2025
 01:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714221545.5615-1-romank@linux.microsoft.com> <20250714221545.5615-5-romank@linux.microsoft.com>
In-Reply-To: <20250714221545.5615-5-romank@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Fri, 25 Jul 2025 16:04:57 +0800
X-Gm-Features: Ac12FXyG2VF4VdQLGnMHOU54EmL0I-F5ODIYDs9CDmGbYwFuca8sVz3NIDMA2oI
Message-ID: <CAMvTesCjbsG_Uw_Bttw7vL6C6QDCzx-pxAi1FBGAAS_54LcqFw@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v4 04/16] arch/x86: mshyperv: Trap on access
 for some synthetic MSRs
To: Roman Kisel <romank@linux.microsoft.com>
Cc: alok.a.tiwari@oracle.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, 
	dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com, 
	hpa@zytor.com, kys@microsoft.com, mhklinux@outlook.com, mingo@redhat.com, 
	rdunlap@infradead.org, tglx@linutronix.de, Tianyu.Lan@microsoft.com, 
	wei.liu@kernel.org, linux-arch@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, apais@microsoft.com, 
	benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 6:16=E2=80=AFAM Roman Kisel <romank@linux.microsoft=
.com> wrote:
>
> hv_set_non_nested_msr() has special handling for SINT MSRs
> when a paravisor is present. In addition to updating the MSR on the
> host, the mirror MSR in the paravisor is updated, including with the
> proxy bit. But with Confidential VMBus, the proxy bit must not be
> used, so add a special case to skip it.
>
> Update the hv_set_non_nested_msr() function as well as
> vmbus_signal_eom() to trap on access for some synthetic MSRs.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

Reviewed-by: Tianyu Lan <tiala@microsoft.com>

--=20
Thanks
Tianyu Lan
