Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E1A3BF69E
	for <linux-coco@lists.linux.dev>; Mon, 11 May 2026 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516022; cv=pass; b=bpN4lREUXPvqQ7LeVrRLEme4q1ztd1rUuN5rc6xvSE9ShDgY1AYkGf2cDgsVrujScjegaNQ6vRSCKkPR0kuTX8/UytmjNZu1CHwiMl3okCuKu3LfRYGec/33el56SaiUI3TnvwvMXoFFlEJlns5Bzd97Zrajr4Ra7xD2rlSkX/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516022; c=relaxed/simple;
	bh=oP5yysdDDPIjgsiPxg3R6ga9RgA7ojwMpmnEubfpxdI=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=GMdW06N0VGC0zvbE2Gz1kj0VCQap+vTWs5IrnF8zTn2ew8QMNI3IdDXsr53hJFO6bZqgouD1pZfitqM4Nf4HTdBaakGqDxmuFrR+YTg4Lm02mcj4PSOQOCN+XfKxLVW4MQEyUW+arBCE9pcdXrLU525PHf4PQ1J/2DksN7OkF7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TwSdZl+V; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TwSdZl+V"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-393d6025f99so39119001fa.0
        for <linux-coco@lists.linux.dev>; Mon, 11 May 2026 09:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778516018; cv=none;
        d=google.com; s=arc-20240605;
        b=iSB4PVuYZ2yJAU06k12o9yi2aLf5OdKFyTI262qMqh/mK28w2JKtsvUEz/UkRIl4MA
         3JOcFsbOvoMDdSgguxvtCT6/I47PoKZG46bOXn6t/o69KLpzf5sZAbCr94jrAmTMK5Qx
         tffX7/ClGpOmyjJf2MNcpb87VhxXH1I/CniAlVSy56d4S8rSsqSxr7WS4Md8ryLpDN2Z
         eWU5KHMjMi6laBPC4WOFyAf3txDompAi/BwpRakOLRF2RHyOI61YnxO2XajiS8YUK8+a
         kCEOHfJ+cQRcQFafOEixj84BTNT3IW44/JwsBRCvFF15hDfK737vMOLmG9dIUWG58bAC
         uj/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=oP5yysdDDPIjgsiPxg3R6ga9RgA7ojwMpmnEubfpxdI=;
        fh=zCWUz86wIiuWyb5WjMNrUu3Nh4N4uAWL5L7EjAFvL4M=;
        b=XB41/Ji+nOom5cMXHS8vaHzE7EhPjJSivIUipu6BZmyQE93hxUqZNMsUXappx7G5HC
         Q4P7GGncFNjk0QokBkgSQx/kdhWeAGytxojJDMJl5hF63iYV+qtd3dkcCmjaXOnMSiZe
         28x1aaWdtoRgrodeG0L10Sv+j/T/4Dq8893NFpotdMCQApu4USKoVOIW/bHPAiS1YVrV
         S97SNg3UJUsc2ANgJ6WbkP/oGuFz3auNpDYpOQ4vNxMCXMiKmKTJKzqNJ3SCBQYMwfP/
         cDHiL4dk+lFRPvqdk2twt7GdBC1SQOPW9CmOm/XgVt85e7Q9koyIihKW6/xQnP6FU8ls
         dNMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778516018; x=1779120818; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oP5yysdDDPIjgsiPxg3R6ga9RgA7ojwMpmnEubfpxdI=;
        b=TwSdZl+VAHsiH7zFLpOEq7S1Wdu50lJB7deP2eJPGkmFI7He6+mLAmeKgvXkiDn0xb
         CeiL4/T1YzebCpLFID4q5skcsqser/AAJvU93t9igwS1ObK4+NrofaVYJ2eVlGMto2P3
         +ZYGUz2RLrOnM9GgN+H+69C3i9zsk5emttkHo9dN9fP5GJzR8DyLKPdTtXIhqHZyIwIU
         IVN9znR2YAbNFe6wGKTunHzvrMQRogut8AaeScS18nzNOl4g1W5vZTwAyLq145oFxbbF
         ATPgVx2jswz5pLfldGXAa7a+rS5REWdfxMyVnOYPlCfjsSmiWKebRCfoa7QUZPO0vRyM
         rFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778516018; x=1779120818;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oP5yysdDDPIjgsiPxg3R6ga9RgA7ojwMpmnEubfpxdI=;
        b=rv9nZeso+46jQwnBnkG/JJnJokIc7Mr6PHlqYngpyOZitbXP4TVx471qpQPqJOpN4+
         KiK0e4pLTB4P3ldsIeX33RqCYfoQACQ12PTCDFgQDwpILadfkCb6nZE2sX0xpQiqHI7f
         cSpsNNoK5HKj2joMtnNqfzUfEC5f8y4ImmXemjy7xpkfyxpIgYO49QF5TyMZEb0ms+ke
         Ix149su7y8rwAoI2xVZRaJtxIGnLEa/UyJQguwQVsrzV+99sSo11omw93wB8deuor92C
         hYUAoFVlxLWwvoQPT6cjIUVCU0ewjzbwJ9GctyKWw2nQXKrS7zWQrlKNm9d3jb5fJWOd
         pBLw==
X-Gm-Message-State: AOJu0YwdWqyOgE+sibGNtGI0JFsmCTShICpUWT0mMeGcEaI7ts5mP53G
	mleAfs0d3VgtQ/00rRmXdX2euHsw75aDzd5zJY7fZvOoSFjCZDUo9d6GSncPLSYLgNv/jgBSlnd
	sLtUVfpKjgJfMv2pUbUKgupI0mvH+cQHCfG0NyvYq/qmGzAGSyyh0tZ+7
X-Gm-Gg: Acq92OGJes6+DMM8Ck1c0ou5fhNQBqnq5O+KWXxPM4hMWYS52YvGcZxx9lvJSfiZCvq
	CarN3Apcq+cP+gNx71zwrnB1TmcGVscL3C2WN6tcFBYU3amRhvKcIsBVbVI53iPiU4Y4i3mpSXS
	ijeLT5UL8kSyaW3wWeU7c2dldRjTwYLVBj/ro0Nr90k72EsIqXqOsMv2XcAPOxy5TWDZbpJFYkF
	N3QWf8izu0aygXVxsHZ0/iJVxQaDu9moXIdIPUNNYHfqnTtTDs36/CoYs82Vt/oTn8xu1BZFS2C
	M3u/mT6qKqd8rZexg5HBkkQHtrisk45WXLmzcLGPiR8jsuq3ss3sAL9veRnkCL6EVE4AH8W3OeT
	qnR+3
X-Received: by 2002:a05:6512:686:b0:5a4:d0d:84e9 with SMTP id
 2adb3069b0e04-5a8e0ec4f2cmr52775e87.4.1778516017324; Mon, 11 May 2026
 09:13:37 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 09:13:35 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 09:13:35 -0700
From: Ackerley Tng <ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 11 May 2026 09:13:35 -0700
X-Gm-Features: AVHnY4KOmfBGJRuh2muMrz7XUq1AEoAtQrmqBfgNBg1bhfN7BYvKUkZnUAn4pXY
Message-ID: <CAEvNRgHAOQbkPWfdDiELxx54B6A=gdtbyjX30+dCUjvkG4PjDQ@mail.gmail.com>
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2026-05-14
To: linux-coco@lists.linux.dev, linux-mm@kvack.org, kvm@vger.kernel.org
Cc: david@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Our next guest_memfd upstream call is scheduled for Thursday, 2026-05-14
at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

In this meeting, we'll have some quick check-ins about the progress of
guest_memfd direct map removal and related patch series.

Then, Frank would like to talk about pluggable guest_memfd backends!

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write
Ackerley or David a mail.

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1] https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing


Ackerley
