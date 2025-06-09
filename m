Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3BC1E521B
	for <linux-coco@lists.linux.dev>; Mon,  9 Jun 2025 21:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749505120; cv=none; b=SUwFSxzl/PreGSJgvcj5eOzcC9NvevTlGgdhfh9btbDKlrfH8antDm+5nGlGWDlGa06A7pBJc3C0TYzTkaj/G6EB9GxB5nzL82/w7AeWiTQ8USQ1brxrEoch4kp9G0hDFeH21l3AQNkQKkuKJMEBQpjfYAiPM1aroHzYmiVDZ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749505120; c=relaxed/simple;
	bh=SaFAiKTgjwOsJUvHTTdkRcAJqTcjkFZ6FxQ0f/fdGUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnKtMkhd3BsqsOmF4zQTBw7gYLBI8TAhZVWA50jZfp9y1if6SxqIQCUnjy1O+Z5ZLnKWCDGMEmMFO0Z18GV9Ob4h8fc7CAEi1sauq+YiDSV2ATlpD4OcfPuGU3bHsSWmb9Ftb9EddSGkF3Xy/pfBBNGvXpFPU4+hH96N0gZ/86g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JG0jQTj0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JG0jQTj0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2353a2bc210so41293015ad.2
        for <linux-coco@lists.linux.dev>; Mon, 09 Jun 2025 14:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749505118; x=1750109918; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaFAiKTgjwOsJUvHTTdkRcAJqTcjkFZ6FxQ0f/fdGUQ=;
        b=JG0jQTj0OtuGFtUAD4UpToprv3lsllT+VkeU+rxwNN0t2DAvqG3Bk3zLSe10ipOGMK
         oSCof83Cg4bZ/sxT6/VeSKk0lllrhlUGpy5//J36YitFcP8DQJjQH8rph75qHXjOiOgC
         cmgfIrrwUV3VIVITDyigxhdJsnxHdsGv5RzvrHAoPPD1ZzJqMlf7jn/YyHsTMAX4hJY+
         sekBnYYttvlLN67hg+vRXb59vFyAOp1dLhYbNjoHp/jPf3cYkyusi68bM746eADldzLH
         h+mfA69l69NDoBnd+V5/K/UM9oqF+Hix9yw/CUUMo1kZJao18P9gW9sSvp6AWMk4mWEb
         W96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749505118; x=1750109918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaFAiKTgjwOsJUvHTTdkRcAJqTcjkFZ6FxQ0f/fdGUQ=;
        b=Huc5pf6qxouDwkpJT5xh24/K5SBnVqYk4+CGBP+q1eYgKxhry2tlzoCASPzKJPhDlI
         K1owCQFh6kOJCJ5fkIDa+lxOtp+07kBkpOUYmzhCgbniTfvCsxE/PmAm8HFQeeTFN3z8
         JSufniiwX53c9IGJzmstLnnN3uqaeY7EFQTKH6AKaGXuymcLNpmUR5yispxS2h+tWWAO
         tEyMxaXDkt7eh0q1pbJaBq6b41CB10pQ3B/Ihcz9NsiBVel+ALf3xRcCs+KlP7SNBEyF
         Xcve73zrzv45jzYsO0hQb9CRp14XqX6UVDEIZWBBDpZgaMnivBNyslFq/wuZvOHxle0t
         B+/A==
X-Forwarded-Encrypted: i=1; AJvYcCVogV12h9eD/oEkR4+OjVfu+yD5PXtWpLZoQ5wtFWqQwfBFPu2ozKnO7Gf9lczfdG4VMGSW+gjQCVuX@lists.linux.dev
X-Gm-Message-State: AOJu0YwiZ2XeSmdDNXyL9VicKK8q3dtUFsZwZ6i549byvhndzxtO+Tdg
	y1PKWTHj1IWklf7UQIkTbaODV0nD0hegfE8KfagJlsyO21us3w6sFrrKA/OTSAhskBob1pIHhJS
	UF6YXGndDqCFVdguKR1YWjFd8aPVJslGkAEIsrKdw
X-Gm-Gg: ASbGncscAVPWJ8stQCSdXKCam0c9BluiZr4gIVwpnLkPg/+MZVFbEWUW4Aoc8OgRDqo
	E6taMuAIDpAOuMSOMDa1k3xZFAgdhVCg3fywsGqj1Dms22DvMdvLCizBIVhRUOV65TWljLfGEf8
	c7ccYSuaiTXvxuw0is7W64B7740U/Gk5h3RGGw50VNmjVs
X-Google-Smtp-Source: AGHT+IGlMxoMfk4ejKZyyV9+YbhB5UoHaLz79R1eavHJBDLl4qhCb+gDlPAIrYejoRhYT/JkVxf1Bca9jq8QKV67Sag=
X-Received: by 2002:a17:902:ecc6:b0:234:e3b7:5d0f with SMTP id
 d9443c01a7336-23601a5287fmr215303085ad.0.1749505118235; Mon, 09 Jun 2025
 14:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <LV2PR21MB31800E697258585BD0DB7816A56BA@LV2PR21MB3180.namprd21.prod.outlook.com>
In-Reply-To: <LV2PR21MB31800E697258585BD0DB7816A56BA@LV2PR21MB3180.namprd21.prod.outlook.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 9 Jun 2025 14:38:25 -0700
X-Gm-Features: AX0GCFsfUSSqRaCseNYRK96Qm9Bf-jR7P2zNdWfl0-hvxNJqGMgyI-9AbHK6mlI
Message-ID: <CAAH4kHZDnfe3L3rJ2htEzT8FCbpVjTmU+u2M94mHbxYHw07WFQ@mail.gmail.com>
Subject: Re: Confidential computing Linux kernel SIG meeting Thursday agenda
To: Chris Oo <cho@microsoft.com>, Steve Rutherford <srutherford@google.com>, 
	linux-coco@lists.linux.dev, Alexander Graf <graf@amazon.com>
Cc: Jon Lange <jlange@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Steve Rutherford +linux-coco@lists.linux.dev +Alexander Graf
I don't have the agenda, no. Steve runs this meeting, so I'll let him
comment. If there is nothing else planned, I would recommend the f-UKI
topic if Alexander Graf has any further design updates about launching
a firmware directly from a disk image.

On Mon, Jun 9, 2025 at 2:18=E2=80=AFPM Chris Oo <cho@microsoft.com> wrote:
>
> Hi Dionna,
>
> Do you know if there was any agenda for the CC Kernel SIG meeting on Thur=
sday? I don't know where to look, so I wasn't sure if there was more follow=
 up discussion planned about f-UKI from the previous one.
>
> Thanks!
> Chris
>
> Sent from Outlook



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
