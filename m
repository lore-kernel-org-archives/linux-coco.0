Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93D476045
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 08:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325684; cv=pass; b=TSOVss5Y3iJy3ZSKtjt322lhpwh05lEAQKh6LQIWxr2659wxHPvR+Q5NOMyTxG/9+5mubbufayQXp5I7bNLhj/T14Np48eVTIk0g4mU6bEWCpujy11ZelLuR7HEg7UxHiB78bXWRAX7ab5wv2+9UI9vYjNQu0jaszPg8SUf2pFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325684; c=relaxed/simple;
	bh=o+dFtfvif9TVnSmCofN+O8+24ShzOcRw1mFy/ybi7lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzNchyVY1UA0lfzK78inmpqsuPVPnkXIWITcd0zrYCOuUy8lfYPAKwMT1Yoj15a0XGdHkRD/riab3a0XMRfFIzO45TJxiu/jwjEM4PeHQICb2fWxYU6FR/7wrOT3+TOcK/vYztezfi/5YoYrr3deHqmkepJsgjtjYcA8VY7ktII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hQBQT5cB; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hQBQT5cB"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b8c42da963so4471e87.0
        for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 01:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790325679; cv=none;
        d=google.com; s=arc-20260327;
        b=jo75E0CFsJFKPUYqJO+j2+fIrGmJoAt7TQlOnkEFe79rMuIP9KuWYBFil14G4FwliR
         ukYI2PIJ2FtcNkj4olDtDv20U/hZgsbaVcX6XgWZS5bszZcm9sBt2/srAhQxivKkThvn
         EinUwOGRCPbHz5uLLlBtwXvs3jtp07qc3uBME28hhNzhqYbrjmOXggaO94dh0zjooAQd
         o1ZvfDpnQdBbORBCBbiVuffFpHkRQAuAfcNXVNEjZ7XOfKswiaIVfGS2g46lrNvujTqc
         aAF2sxI/QW8YVPwGqy+7GzEvZbaGIolM/FNSslQSKsyufEr2xUPu4wi/Vx9iBtMCjrAI
         LBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o+dFtfvif9TVnSmCofN+O8+24ShzOcRw1mFy/ybi7lY=;
        fh=397sy2hDGkIBsrRTDjz/jAuamOlyj1wjGZDzkjrL/ok=;
        b=g2yHPkvXpnuzIEvSyeS6CKgWyooVbz2LVwtQpilFE/wh6TSZmV8slfzDSYJdGuBevG
         iLVyGMaTgdmvJBE4y0ZqlZRT/VChqTp45l7ZIICG8Qz9VeEOIleJx1FPoBYFgNUX1FIy
         Z18ULufGLa5KGXWQxkzKMbBTYdhOnyCb5zBHeczvv2oTMEXlGM5v3G6hmR+eeKwDVxAK
         xWvSi6k2vjKf6KEx/3/EDFmnCiBcn9bixBmNR6qzaUaWV2OF1ti2Gi8uG08tVbK1cF+G
         3L909dZ21fdvDAH1E7391FGHa7Ni5lKSIfydXZMtLIFUSvnlgQq9CuTGK9Dr5pnsJwnc
         P3sQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790325679; x=1790930479; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+dFtfvif9TVnSmCofN+O8+24ShzOcRw1mFy/ybi7lY=;
        b=hQBQT5cB1TXocxW82uJa01cSFIVaEqmT1K2HUM9WS1U1Rh60frQMX/eOyOIA+76bvH
         fIshEl1S9nGeRlkgvm7q/VRV/vKNOpyV3mzhaj7eRk896LM1YzjSRtuE0E9FqFg0xKHp
         Q2N3zKyW3bmEZo0B/9nV+3X/aHge/zrOczKL+SezUg+RyN8WXmXhpCuipMrZ2trdtxVl
         9kcWjlsMLc15qd6Z53qF0bSBS5t4FsSYAony7ADKbSmQcc8/toTTUNb6QrHRkvd/JlNw
         UIXmZsPi9BRKNr1LYREJfsQvdDkRjvbLE0CdmNRrEuO21nQDGRQuR8DYBtG6ROS9IIYP
         fG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790325679; x=1790930479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o+dFtfvif9TVnSmCofN+O8+24ShzOcRw1mFy/ybi7lY=;
        b=DSTfPsGtzdEICWRY31DURYJXEIE4YvhSgpSHFFJQMb6fs320qrOddkXfvHb8HMg7ne
         5/kFgiqm9PFwTEZWSTOgwYk2yybEoJeL91WiADNo9l+DV5pS8rq4SfhqLtlXHw7hxNHQ
         9f925yENUaIJ2F4CTCcTej9cSBjKSY/dpENzuFCNQ3v/Rd7z24V2MA2j+D3dEwBoAbyt
         pNvwCEkoVH92zi3aHydKceARJTQUJSwNbU1ihOViSCyzBM2WoAOrtS4oXY9FP7t26gAd
         7eW9VXFgG4fP+bePbtba10+Y9q9lbXpp/2MiO8D64K/oarrC1IL0YkVZ6ePASBl91Qwx
         V/6w==
X-Forwarded-Encrypted: i=1; AKwUvBwlYMvTsTeHTgZsKfWMsnpshX1sHv6UDgUWHywHOBLOrEZ2ujPlh4l/k4kyvwW73f0CC9yWuj1N/xYM@lists.linux.dev
X-Gm-Message-State: AFuF++m4jXws2e4dQuMYkIIGdqc5DcVJZr2hXRbOmghVBlCJFisJEDsr
	70QPPYkYI4mWiarLGMRKruZUuvK6WgYgY9a/3I1mbFdMt58qUCJ0ntNHTy1ltfqtOq0MPy+fH7i
	rp5j4GfEGb2DAJ8GdQRE2696vzfY6dCJhBM+lTdmL
X-Gm-Gg: AYBFou3XGu3BEXsUGq88ITz0bw9AEwfMVJpVPAFUQ3GHQ7RLG2W8qyrG0hZYfqx7NsX
	ddDBnc61zbRnQL/h+Cuh9Qr+dh0Xa1+pl8+/NiDhoAm1XU4zgoALvR7F9k5N0vH0x46t6END+lb
	en4rjFTwWRB6pnDfSnD2rOsQRnp+ZZ2Nc3pvu+46L6XXhkXCjpoDOA4bhp32kxs9zK6lKmdNFRs
	m0fYHgCbdcuoJ19BdJyngjTTxbuO9izFIn03QFelyU/rFNsqubvwsXJ37wCCyjF/ePbx+rd7pEA
	OgdSaRgyexzd1jRkfUxO6wTICfSingkUbhD1n0BPHIeuJl2MxznwcEKLhcX7adZeAGFE/9s0V8T
	decy+KFYBbPAStCmr6dkxynVd
X-Received: by 2002:ac2:499b:0:b0:5b8:e83d:6c23 with SMTP id
 2adb3069b0e04-5b8e83d6d52mr34962e87.15.1790325678596; Fri, 25 Sep 2026
 01:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b91dbfae-20f1-4b9f-a25b-4397afae80f9@kernel.org>
 <16ffff40-4ef0-4312-a700-348603f05c0c@kernel.org> <CAEvNRgGW_VHmT82q+bUqHh_5G2Z9sUF1jJOTiVN4Z8_cA9A50g@mail.gmail.com>
In-Reply-To: <CAEvNRgGW_VHmT82q+bUqHh_5G2Z9sUF1jJOTiVN4Z8_cA9A50g@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 25 Sep 2026 09:40:42 +0100
X-Gm-Features: AclHuK8wuRNyKESPsObp4QvTkrVR3_lCINqfI6LnWNaBHbsf2BpkSVcq1Eie6oU
Message-ID: <CA+EHjTz+WgXEW5RTxXf4oGeEb1Tsm5Ha4nOc4S1jBcp7jxP4+A@mail.gmail.com>
Subject: Re: [Invitation] bi-weekly guest_memfd upstream call on 2026-09-17
To: Ackerley Tng <ackerleytng@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	KVM <kvm@vger.kernel.org>, amit@infradead.org, aneeshkumar.kizhakeveetil@arm.com, 
	ashish.kalra@amd.com, dwmw2@infradead.org, eberman@quicinc.com, 
	fvdl@google.com, gshan@redhat.com, jackmanb@google.com, jackyli@google.com, 
	jthoughton@google.com, kalyazin@amazon.com, kas@kernel.org, 
	kevinloughlin@google.com, liruxin@google.com, michael.day@amd.com, 
	michael.roth@amd.com, mike.rapoport@gmail.com, mvaralar@redhat.com, 
	pankaj.gupta@amd.com, papaluri@amd.com, patrick.roy@linux.dev, 
	Peter Xu <peterx@redhat.com>, pheragu@quicinc.com, pkondeti@qti.qualcomm.com, 
	prty@google.com, psalian@google.com, qinkun@google.com, seanjc@google.com, 
	shan.gavin@gmail.com, shivankg@amd.com, sidtelang@google.com, 
	suzuki.poulose@arm.com, tatashin@google.com, vannapurve@google.com, 
	vbabka@suse.com, wyihan@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Thu, 17 Sep 2026 19:41:14 +0100, Ackerley Tng <ackerleytng@google.com> wrote:
[...]
> p.s. Fuad, for pKVM you also mentioned that you'll need to check if the
> guest had requested for conversion first? This might be the same/similar
> problem.

Sorry, I missed this.

Yes, for unsharing. I'd said EL2 does the transition first and the
host then accepts the conversion [1]. That holds for sharing, but for
unsharing with guest_memfd the host would have to convert to private
first, and only then could EL2 complete the unshare. Otherwise a
failed conversion (-EAGAIN) leaves the host holding a page it can no
longer access.

As with CCA, the unshare would stay pending until the host checks on
KVM_RUN that the range is private, like the check Sean described [2].
I don't think the per-VM list in the host is required, though: EL2
already takes the VM's lock for the transition, so it can track the
pending request and reject conflicts there.

Cheers,
/fuad

[1] https://lore.kernel.org/all/CA+EHjTwLRzrq0vY0-OosENJ2Gkknerux53aVBj0zGRQUkRQP=A@mail.gmail.com/
[2] https://lore.kernel.org/all/aqw_uBIYig_uo5Eq@google.com/
