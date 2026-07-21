Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F543E06E
	for <linux-coco@lists.linux.dev>; Tue, 21 Jul 2026 23:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675272; cv=pass; b=NrdKFEKtJk7sbSK2rouhWT6uHb7hfQShFZtvV3r6LE80Rt8i/Vu0h56twmPQ1mDpUv3IR5VF0mLAKNOAsxBf36yZujDEDAuOQasAqW5OiWMdt8Xfvcn/NKY5irokmzxRLqoE94WQ6Q8j3KlpUCtFtoDOPkC0iKy0xtya6HbMWPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675272; c=relaxed/simple;
	bh=3OQXXVa58whyMEmCorMBVgdW3liv+RGIOlQFgF8uhhs=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Content-Type; b=B3Omt+b4Z/JDlvYE2ZjDJbdT2I4VbGOrm8L0uyWyyDAC3po4AWGrbI+LHmsppro3EI3wEtXh8zp/aJYBgjPoHDapVb1Fgu//dLbGQy19Uexm5IZq7bczpS1esaf3y551/dlY/aYBnW/B5ml2eBIXyRdBtBZ1aZhQ84ava77jo74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vUv+DO75; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vUv+DO75"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso5198753a91.1
        for <linux-coco@lists.linux.dev>; Tue, 21 Jul 2026 16:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784675268; cv=none;
        d=google.com; s=arc-20260327;
        b=Lw9BVBwxxS6qFJCrvnitruFtrn75Yus9N+EW7Z8R3aqawotxCctqJREoVmMKDgTrMJ
         n8yUHNHBCx//fp0nzRCX3LtwFXsAYc22Hl+1jYFpPxtxgr4PmplK4D/KIQKP8u6Bcye4
         60ZGaf8IzhqgYvlEfrR6c/pmV5bmML3sSoQY34Q7iGdEflL121FTvkTchQMqP8jSgDUT
         GuqWb/YOuAreJXtKpKtifto4VV2R7Qq1S0+IbgHhTbMjzv9zWMISBK4pM5UMDFnwbG7F
         IBJGc0lnB6A+oo/ngl14sPfYf+0kNu5flrogwh0/aVd5XneC6J6FQYyTdguXZGEozJn9
         ZZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=3OQXXVa58whyMEmCorMBVgdW3liv+RGIOlQFgF8uhhs=;
        fh=mfH6UrtgAWUlYfrS9fZnXMZau047Mn71+T7giRJTBOM=;
        b=r85/kWr+H4x/lboYLmkmVHO+MNDUGNAXaR6SZJKzmjqQPpWq5wJPVnGH/+UGI2AFtj
         QZgEzCxFNdtFnmtCvXqF9IZw0H5JUp8BoN9julCv+mOd4W8kxQLRpJu7fyy6uWQKvBh1
         bes0M7oNi6hQx3yq8DAk7NN/7UlAX15nSLazXSpA3nguVASvSAzTe97wUmaEnyE6+7Zl
         RVY3RpVXYT7zW/ng0gwleI2HbOU+T4eJaG5mPoHzQ/aU5ByRw1/2lo5gnUD341tesL5O
         j3pcME+H3lHz0eajbsymbYXd6RG8jfqBO237hA8pKfLV9EKiG6GCUq0JWLeYOFEPCEmT
         X4pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784675268; x=1785280068; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:mime-version:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3OQXXVa58whyMEmCorMBVgdW3liv+RGIOlQFgF8uhhs=;
        b=vUv+DO75W5WzpCOPDSnV2Z4Jy6AEytzYg3XS57yrD3umSJ63KjmpBQt284QCJBXyoS
         Su1WHOIf6We+tunkzWXbighubREP79U5ajXdCuntggMpYpwfkL8TPLT/QCzslPr/8TKp
         nfvfln3TOxM5/jAaYREnYVHRQK3d4Z42U78dFXeBNwJB63rqJdfVYlcjUtxhCqYekoQ2
         XZQHxFB37cGaoWIJIqp5pXIdJxNhJHHv6gZWqHMcJAtHXczeBH/qeBplyFRXyq6KLuxx
         mkXLcSZXgrOesqqbwJbb3HbqxtLdk2XNCnE84gZBINKdrzPspZILZAt23EgHIr5+fSaa
         qkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675268; x=1785280068;
        h=content-type:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OQXXVa58whyMEmCorMBVgdW3liv+RGIOlQFgF8uhhs=;
        b=ID3v3/BuMLG2R8ryEo1hwJJxoz/Wswv1KPv87/7pZwraaf/rYRU32fj2jCywJ54Wny
         lKro6mh3GjiI3L76w9AJqFHHPGR2qTIQEAgAoQ/hRtiHlGw2Tqne5kzLjGRbq0X3ajMr
         7gpMJQUzeENrMTDB1RFsT8wz+K9mF4Pk9bH7UVBAD2HPjrs6vcXcJRAJ4iF7JPZ6gIKP
         Qoj8eQd8iVL5XrcEidGxVHOkL3gsR/kp28cHLv2NUrx9IbAd7O1nzAjrxg8psPb6jcjE
         eR1c1+6xx0VFRqqlWiftVd3Ie7zv2cfl367GRnkTg5rl0Kcmud7ngsG0TOSQpmQsw5NI
         +Lww==
X-Gm-Message-State: AOJu0YysumgDk6L8RPqNc8eRADNn3F0W5PL4nDlNMIVQ6+p6l8HE51Bc
	EDfTmNHgBlNzDqlnzde8H3Unaqd5w2JHhGJ2qdpaAQOhcAhYgRacEkZAXdZCmHj8lhfdjZd5mjK
	dKf1MVDFSxR4NhRmDvVpwS0o/4tN12liVb2XuTp6RxpuPQ6opWysOZXo/
X-Gm-Gg: AR+sD10gNHOAMRPDI1dK8+dFVtscvawJbbsAJU4hkODRWPFVGbNMN6vWDCtvmtj3kDg
	8kDskK95WFusXedUg9ABtzvOT5CJecAeQYFD9L5D1BSwgxKLQlxmVYqR6/DlBys/Hp4TNPt4/5C
	/uoVIRfw2APncCF18urJwNX3AeK8AqhrHw8LpstBSandBnCPizp4I2JFZxyxQhZlslKUzPyya+H
	N8+AXOEnTKzcJaFlL0zPirgXCv79SmG1/orW3I4JFc+gctYgnQPeqDzBLSbsFftShHBzR5pdJfc
	C2YcAnTlHMdDSiCqg1RhQmrHyMMamLVZUK2bXHKS62MfFw==
X-Received: by 2002:a17:90b:1345:b0:38e:21da:9257 with SMTP id
 98e67ed59e1d1-38e4b56ed6amr22248144a91.37.1784675267895; Tue, 21 Jul 2026
 16:07:47 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 16:07:46 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 16:07:46 -0700
From: Ackerley Tng <ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 16:07:46 -0700
X-Gm-Features: AUfX_my9ZoAAGr2xVT-3ET2pTUKEhed6A55b3pp5x-TSu1YG-G0FttRwIwLL4RY
Message-ID: <CAEvNRgE74GL-pr6=GRpQWriGwXh6zsDP+ULxPd82GkFSQgjJkg@mail.gmail.com>
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2026-07-23
To: linux-coco@lists.linux.dev, linux-mm@kvack.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Our next guest_memfd upstream call is scheduled for Thursday, 2026-07-23
at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

We don't have any scheduled topics as of now, please add topics!

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want a Google
calendar invitation that also covers all future meetings, just write
Ackerley or David a mail.

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1] https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

Ackerley
