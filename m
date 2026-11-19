Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795124844;
	b=Fr+RIB//Q52owBNwSwY3kqmELIYUNdPwL7Ydhq13CYGrxY65xbCyPmstzX4XvbF1/0th
	 vQR1EQ6EDCi39i5x7RSnosfUZWtaEmkvelcQFoLlYWUxToJg2NQaELP5g7s6hoBwAIxKp
	 z2ODVXyKc6iOlpwJETk7DtZp0QQPn7t/jx8gU4ozQ1bHBwcL6CesYW1CcgNJfYtjKUN+z
	 Q1ZpG7kpIW4Bo6drX2x5ct9bG82Z8xdko2ok97USofijTmMx43oEl5CGBfOZkKs0+1GFt
	 eKJCkoG3D2TrN+4GPxHllGuGiv3c0sE2zgTDPycD+12Q1s1bRS6+Sk8Otm92xH8j2TA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=L7EofMK/Ds2aCpVQ+mBzdmSBmTPWhoy8WE97V8cVUk4=;
	b=eGR/2FjFAvN3/MsmyLyJzjk4QrRBOK9KP446B7qvS+97NawnbByA37Q01m5WqaS4E8ZN
	 GtwpBDpYkmmlj9v4TB9C2ak0FB7YbJQTTsLx9jJUgpaqTYkvD7c4ddFfpc09htzFuJR2u
	 xskJz87gs8ZD2q5NBr4Hpa2ECqE8oAdVx72LHLErqO4nNkJWlwNlB2BxsrtUSenQVge0t
	 CSnhtqI3wpRw01eE/H20ntsKBrLIQ4VyiTT1VhQMFpjK+b/eExO1Hzq9babteBpI95Lpk
	 EDQ1RFg0TrEgJKOK1Uk4nIsP2676cG1y7bNftCoBVaNaghILjfAcR16CgdDxhGY3IEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qJ2g02MH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F740606A325
	for <linux-coco@lists.linux.dev>; Thu, 19 Nov 2026 21:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F740606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qJ2g02MH
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-92110499585so3587886d6.0
        for <linux-coco@lists.linux.dev>; Thu, 19 Nov 2026 13:47:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795124842; cv=none;
        d=google.com; s=arc-20260327;
        b=rpimLB34xSI5Q+M5QT/MtVCCt2dDXzyWOwvuy1vw+UWSzFtzy2mNc6U6OgoMw1CsWv
         cDwWDLKSkA76OLWiWUMYy/kV5sODwTROaXNrP4QFg/UGrvOwZn4qyI3bquX9N4/9DGdo
         TN0p/8Ng6IUiL3fTj+ky2Zhj+ByMPpXowkedRJRRp0KsosBizCruVONDmdoPzglb6AgZ
         VLDmzqNbokXUluT/671FtRwqbEF9bvfPEW5L84lkuE6l0LjwhJbpvY93G0ZVmVDg55HK
         bgadI8GzkCqFslIW63xFdtMVNPISDNBsdsFWtC7rWGIEJKeTBFQ1J1wwYyL+chyAaoSQ
         x3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=L7EofMK/Ds2aCpVQ+mBzdmSBmTPWhoy8WE97V8cVUk4=;
        fh=Gl4NfJmnFHBxqpjcFRGUKAPNlLucdtvGNNqV0bv7lHI=;
        b=XuoaOXvMmOhVuTaxXSf8y1SIDKo8+W/GwzX0xUeVZe/1g1ItqY0LLn0EZsVVe6jfZ6
         LPK++l0xwlxAvALVJypypDafPrssUFfGhUFydZoyBfSfhG/abLjqIJNhJIQCAF5oQuC8
         co+VVfCvG67iwNoa0jLcYjHnZSImcL9buROOJwBB8eOPqIthEu+6ASaJh948lTEq6Sf6
         g59kKKlcrABuBWLUXLjn3LaFqTdVSP3arh6bgzA1WgLqiVQk+U7vkefPv2yyE9V2gHiB
         /7b5DSAmKBENkaYRTaTutPGiFGp7NTX4w0HC6FRYV+Nwpo2rRXz48U+j3mNLRhv+L3vH
         R8vQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795124842; x=1795729642; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:mime-version:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L7EofMK/Ds2aCpVQ+mBzdmSBmTPWhoy8WE97V8cVUk4=;
        b=qJ2g02MHMBg5w61MBzb46yZl/u9i/93k5I84iryzQngoIzMjKADXtxQW17+PbEKXfo
         rHiXUZphu5V8A/QuknwxtzpAY9QQkHEZHYUygElpsPNFfSiUpEwn7B2fxHyY5jeaDCP0
         A986jHyb6ZsI2TFE8qH0RqMO8OeA2IPxUAKrtGGOQW2n+dogUWS9cL5+BWgNpncsqsEC
         PRLGHkgPfj1M4NnCagMvQZySznS5awjIgJwejXNAe/ZhWidaESsoB0RrC6oiayLsz98K
         riMq1smFRUhj86gRaWn5uGcjI8PJ0ypwPTsa7xUXSXZiTuvaFpyTCPiP/2A54M7en6fY
         Axzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124842; x=1795729642;
        h=content-type:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7EofMK/Ds2aCpVQ+mBzdmSBmTPWhoy8WE97V8cVUk4=;
        b=tQB1KdArPcWhuKKjVgLTxcQ16BlLmQU53pTHSZWjcSuZfrU4QnAzl0Ux6hdLUxPvvA
         lmvnTuPbvsD1uKBbHcoHy4c7PwznBKd5W1ponln7FAZvAVTBvEY7yytczIp64Xwm4Urm
         FhVGuQDm2kcKswOEtaIxS2UOX0eqKCJRn/1sMSk2wOSApRePiBgng6NrSgBkx41og1p7
         06Wwufj+UVd9Q8IJVmqalzwZQAXSZb6WbxaPkSRoSLrV3eSQsDqENvCvQyLbT5Hq5vq2
         4ds0mdJQTge5cbTVMqyUgET8Zf65xqFG74zHzWiXEMJvDerlFecA0Z2sOgPKo6il4Cg8
         nffw==
X-Gm-Message-State: APuU4Z8EvQJamCC6cwi8+dYRWP0Qyvh1fT8jn0mZUQkh8BEecV0o+Qdm
	bZWvMi/7Sy8eDsKWBbBJyLFHFgoh4PfqWqcv7MTr2/5gffW+VG3jpkTCnrREhGbN19Q+QWw5cQi
	H8qCEAOrRrWvYxu/ubN3HHYD3bwa/Y8400uPBrWPIvF5CaW9dt3bdu2NXwcs=
X-Gm-Gg: AZFdTZdzqaOLuwdUWLKx8koakvSQrF1diFXTvTrBHjfHQmStSp38Ee9xZXBRO+JRIfV
	XXYK5Qo6wa28UI3G+n/8RG4KEcAWHYv4inu2dlKINEbvBuKBDWnSEmPZbjjlCRYcnqhby0bIMz8
	olXw6q5AfBLFkYJAY3le23t4K4QtHSQLwDeiUeksIjK/RYOREaA4dJLLZBVVK2f7JTJIQIs3G0E
	/QWjeahitk7v7FzMh6rXz9wySsmVa0qt97rYRxV48NEV/sX9N13KiO5Md5Otvfq2M8YLx2Z/AcU
	U3E2awdTsGbI6KTFSbD8pPsQKZGrP5LXvEeCFrDiwrmWGSYixUCr8xQTadeGakPlJevNZaDVGrP
	wbUJERSbqskH3QYALEZcRfnd0ydCfvflVISa6i51MiByRyKOadBmFxI+iA3GyBAgLU81jl5m/TC
	O29hBUwL+ymwzDGUFvKp6tAv8=
X-Received: by 2002:a05:6214:460b:b0:921:3585:de48 with SMTP id
 6a1803df08f44-9213585e1c5mr10964386d6.40.1795124841760; Thu, 19 Nov 2026
 13:47:21 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Nov 2026 13:47:20 -0800
From: Ackerley Tng <ackerleytng@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 13:47:20 -0800
X-Gm-Features: Aa3M54rWsn9wxe2P3t1_p7RxahQjwFGHSbiMXqoPeTbRFHx6sSpgmtl4W0fkKbs
Message-ID: <CAEvNRgHpOQsF1E78uMs8OejSnNxWdRg-1_b-V56Z=kmotJt6fQ@mail.gmail.com>
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2026-12-10
 (2026-11-26 cancelled)
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	KVM <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Next Thursday's guest_memfd upstream call (2026-11-26) will be cancelled
due to US Thanksgiving.

Our following guest_memfd upstream call on Thursday, 2026-12-10 will be
shifted 2 hours earlier than the usual slot, to:

 - 6:00 - 7:00 AM PST (Portland, GMT-08:00)
 - 3:00 - 4:00 PM CET (Munich, GMT+01:00)
 - 10:00 - 11:00 PM CST (China, GMT+08:00)

On our agenda for 2026-12-10:

 - TDX huge pages (Yan Zhao from Intel)

P.S. I've also adjusted the time zone for the meeting to be
America/Los_angeles so it's always 8 am in Portland. (It's what David
used to do for daylight savings too. He's nice to US folks :))


We'll be using the following Google Meet:
https://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want a Google
calendar invitation that also covers all future meetings, just write me
or David a mail.

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1] https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

Thanks,

Ackerley
