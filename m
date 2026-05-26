Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2B73D5236
	for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 23:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779839393; cv=pass; b=BInnIVNgynrKqOXsBDs7imSOOz7gjYdFvTOs8SMvetcVfmshorur7oOm2ICXgj/XyUqxA7mxrEmIg0lGDheF6xp/iKbTff7v9dIUlU98ti4dr7DLTl+jemXUL1e0Qk+pny5C1qJs3SP+6Oimwahzc3CU7VboIZ6knZjZPo3RSMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779839393; c=relaxed/simple;
	bh=UFTUqui+lyDEpkII00aPHz64gTpTCUqug24pFaLMXHE=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=XKJxqZSsEO0uH1hmVUpVbQGNfwg/htViamauGXbXxr5CToxoOIzfw6V0xBTw/l//JEazZVuUBZ+q6och/vCy9unAKJlkfItJ58cgH10SJPMYGWSr65lKgsjjEtJbiujYqEYlAmBKv275Zl2tWbWqmUtGXMXyWgLwsgcTNaTxOUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VIfswH34; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VIfswH34"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3045c195251so4429390eec.1
        for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 16:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779839387; cv=none;
        d=google.com; s=arc-20240605;
        b=El79fqm/Fp2GTZnUU7yvFyHxT/JYMh3cJaGU+B3US4tmRLzV8NgDCt6vbworvvkiAI
         oM7lFyZq2Jcugsxs3cGLqhnOCblAYEubo4Lm6dKBGcwWlF31HPpMc0/xuOW/z7jmMjdA
         P+XifBlHRu6cQUJMG4EBrZV2AHp/fMrgCkhQpmOEqxLwx/eoLYx75CkOaYGbHypuMnx7
         fs+n3cc8uID9R5nhUqcFKR6zcdXNRByQzjU6zP8fwN8dpt+qjZoxc13L6WxFoap8/gp/
         F7wKNLiPZxsYyX/YSqcQoxMYFrQsabQtez2YrXxq60rHVf/hYwuGoeGtXly6DxPpY12t
         N8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=UFTUqui+lyDEpkII00aPHz64gTpTCUqug24pFaLMXHE=;
        fh=zCWUz86wIiuWyb5WjMNrUu3Nh4N4uAWL5L7EjAFvL4M=;
        b=CuTZuQWbmVzVPGzxvQO/o7OxdpU+dFTNVz/QlcE0RJlzUocuP2lrFI8bsvHmZbTsTV
         Cdtz1QF87PLZxQR2gpPBsO+uy59B/G1X06qiH7DT1QMD+bb/IfYlyb92D5C9Wp4JBGfl
         qrU+5GO8eJKzder8H2gzg61eWSMPeMiQxXsxsOvRfEtI+opmfxVbnMxLHfIChzE5ChFg
         /l+QksfhljUPz8M6FJpsciY2/QWfGilfRDv5Hh+o80esQNg1JZNmLgqVMKtNSXjLOQkP
         YXDIaBCEzsW0OPsNKMRM5SBSBRXywd3j0wWl+GoWz5kE8+x8Ip0xectGi2EnvDaDJvFR
         Pe/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779839387; x=1780444187; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UFTUqui+lyDEpkII00aPHz64gTpTCUqug24pFaLMXHE=;
        b=VIfswH34DbOV/D6iAR2YdLCFfRra32xpFp09c5KXtSwprEdzfRScLCO6Q6E5kb0Jpw
         eV6bLA2ecDbLMRc9NOhwcqKhvUSxp20txUZOOpUmNsf/X1zAJyEWTyLZ6fMgpnxmSblq
         finNVDuWXYlGsxzRbJiUDDUH7A7hCZw+oUeufI8HovzkgvRZSoTbhF3Y/AP4BjSUIK0m
         nRcZVcA/kZXMED2FHiBMOOpYI8ZVzX8KsF9LJyTr9pfQ7p7ekFjfrO057KDGJUIQMImM
         oXwESLSTwJkWjGsuZJm9FShPdZ3CqURQV3EHZrBhEUFBiSbxC2xhD1q/wvVGvWysDNf4
         3tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779839387; x=1780444187;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFTUqui+lyDEpkII00aPHz64gTpTCUqug24pFaLMXHE=;
        b=U7fwFXXpa+zc85I6rmkDs5iFZUHia+g1XkzKnuKZU5Sx2wKGLzRXOklKOxQuUQSnJb
         Kh1KYnPlchBgjIHRPHGnGTe0csqVCfS+a4E/tZeX2O307pemayn/T1jPUPno7nYh6cFQ
         J8eDEUfzkJum7KmCpfC9cBE32eilHyvTpH6ATIG0EHwQC3AA79V1d/2aamzxVXIqStXk
         2siN4eOZrFV9CXXvUvuiGkG4TQxGeBEM/Ephe87SEDqUyB7MbCSXtof5h/qAAGkpEokf
         ds6xyvF0uz31HgFDDqXKTlkqb1XYrQNSLsVNiUeO8KW8R4XCC67M5dHmsMcQr5xflbEK
         DrMQ==
X-Gm-Message-State: AOJu0Yzt6wxmfowjmbzF63qS63b8N1Z3K+hxLxQ3Blap7xxVHHmd37Uv
	UVSRc6gkdpX271gl2fPWH5fclrP1UndU1Jli1A4pmTe5zsDfjchMPhsxQ9GHxnt+oziUDdg0Lv8
	6ThIVhtwbJ8NlJczKHNyAanmeRD1CWn3f+veg8h+bl2NoN6/16LIn2ic2
X-Gm-Gg: Acq92OHwpvu/zJc9zHw5qorgwAgCGsZevVLElWTBE3/dgWpzT4i+S8i4drR3EWRSHTN
	Wc/tXeTrDjpiRwqBdlhUTaLZmm/w6KBGh7dSEI0Q2tqIpqcU7UXG6ZLjl/EagFg6TwyjuFYg+sW
	hbGKp51MCYI6bNWwh4N0NNjbtgfip+cKclT/UmAQT4+aFbUsn79/Ey8L4ysWrFKMFbqOHIQF49u
	UOD19jKoC6XoQN8xTGvcdy0iWRoB9bRHhhj+XoaAMjMNPC37TFefjcuCNG7Fvm+P2MljzSkzqbb
	KooQGILqpxw0cxInkrel0pTcfZ8zoi89sPeNeA8HEh6gqI9f5W01KcQZUCxX5y/u7OWGUo1Iz+4
	ytiph
X-Received: by 2002:a05:7022:ea5b:b0:136:8bdd:3f66 with SMTP id
 a92af1059eb24-1368bdd40d4mr3880334c88.5.1779839386030; Tue, 26 May 2026
 16:49:46 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 16:49:45 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 16:49:45 -0700
From: Ackerley Tng <ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 26 May 2026 16:49:45 -0700
X-Gm-Features: AVHnY4Jg_aMxqxLmYUYtrQZjJQlu067bf5olggbfoUjTDaktgramXq6wUUS1BnQ
Message-ID: <CAEvNRgHLVPcJenAej85Q31YrM0tCnTpibDsEBdZmaTpf9QaTBA@mail.gmail.com>
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2026-05-28
To: linux-coco@lists.linux.dev, linux-mm@kvack.org, kvm@vger.kernel.org
Cc: david@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Our next guest_memfd upstream call is scheduled for Thursday, 2026-05-28
at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

In this meeting, we'll Tarun talk about guest_memfd preservation for
LiveUpdate.

We also have one question regarding virtio-mem and CoCo forwarded from
David.

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write
Ackerley or David a mail.

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1] https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

Ackerley
