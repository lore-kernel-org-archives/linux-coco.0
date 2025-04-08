Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3BC22B5AD
	for <linux-coco@lists.linux.dev>; Tue,  8 Apr 2025 00:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744072776; cv=none; b=YPbRLI3koSvJKI+uXJX8OqMh1FttZAYHGvx8QqwGdRez3RloBlQuWDNfK5Par/G++XQXge3wnbr71xoOS/k5ByrSj7B5r82gdAgjzPkxa7GqSDI1LbP/eXHgbjHHI57a5pNhrjsodyTdSYlv0J5AeJ5Y4ZsKBstYqAkXaX28Qwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744072776; c=relaxed/simple;
	bh=CH7nWE8hxjYh1hNdsD6EtWR+XZxdRrhM8+42fQc31Mg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jl/mB/7TYJpBWdwYzyshmI1zr7FOJcTKHuGCd6GAXxCLwdepJgAGJ6iU5ti7/jufFIxioW85vYAM8s0Nys/r55oB0JgN+2Pp1wV6yB7vcwD8sYjIo2SQmO2gVKKFJhclBQMO86ShqKGzFUZXkU88/OzZwUiebureeXwWKKbAcRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ao0HtsJn; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ao0HtsJn"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86feb848764so2069971241.0
        for <linux-coco@lists.linux.dev>; Mon, 07 Apr 2025 17:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744072770; x=1744677570; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CH7nWE8hxjYh1hNdsD6EtWR+XZxdRrhM8+42fQc31Mg=;
        b=Ao0HtsJnqIEfNOWnVcieQfKLeZ+s/hvuPz31V7PDxUSDlKW7+5awNRbNBgax2UViLe
         fbBwWGp7xU29E5u7pw98XRLvF+xMcwgo1yHakiFK2IiQcZPQbCVoQJu0hGev6OjTGE62
         +HHsLleMZ1+WGVBx/CiAFCOlZIEN+hxsta1Gkk6eZJ4tbgVP/QJGair/o6tr6UnRmSr2
         2kUoXIOuVqv1wOK7mjagiJ9S1tHkWmGVtojT+9aACG/aPQzpjT3uIhRpfo3OKgB4bj9K
         C9nqDUvPcolT4NLQgrrleoCj1Kpga8+qTKKwwZ0Notl4LLSPNV66rXcfyr+ZZd4nJUW7
         O8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744072770; x=1744677570;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CH7nWE8hxjYh1hNdsD6EtWR+XZxdRrhM8+42fQc31Mg=;
        b=VlZKRJcCIHOcRKqWcHEpOHMa70colFQzj0adDJxRtcGIPTNP1B4V6lGzpiJUr6A3OB
         NGu5TNrII82yCl4QbHM4h8TidJeOsfty/1GRn1ukVNYKMCF/GB+7vqrq8UC9heUq7V69
         zpva+pjHqaMoQ2YWCPqIf+7nQ50sfYLbFJeQJ5mRQ3wj8LtA1/U17jyVzBsUmETzL9oA
         XDjsoaYZmGn9xKrl9tJDq30kyHH/GFlMsgjx7nlOHAQDeUw6Qmd+KInUSwo9gw0BNrMX
         4HLO2ruUlX5UhCs/hK5A+g0OVOwE3SNXTJM8Wan+gnEu/9J5QOFr0RqNkveiNSTr7D99
         DE8Q==
X-Gm-Message-State: AOJu0YxupK3uU0tmveiPF4N0vWyHSjp6qreif+ppXF6GChyPhDuJWIt+
	XiDkPM67nmhDY6SI1Nb1ECLGnHTBB1uXTivQMhh/1KsSsk67NhZQ0RfLwkJsDXT09LfMuEIBEXR
	nQ7RrSY4FVm2OeoWVit4gpyinE5Un4hhbLniP5eidxGao6Z3Qc0Wf9aA=
X-Gm-Gg: ASbGncvTRQlgUBFbKbXGfQKD7+sqrxfS9oRjosDJ9dYnW82vj0BlRL2Rdz74lVWq9Y1
	mvb4o+IqYTnNVqvjB4JPSMQ2RsJuMaK9xML6Gx8ETDjXHsQ2WXbP+4kwNEhFa1MM9WFywiFb4Lx
	Po7WyJu1OR+EqLiljY11CldnhJJf4GC4jcauc3VsQ5VhxXCnNwOTFhS4tm
X-Google-Smtp-Source: AGHT+IF5KWS4P0OrHfJgNfE99B8O+tUqhC0YRvQ+OVi93PNSrACeOegQtDkZOFXZAwENaZycBZ6LVTDGaZMA4KRpLmE=
X-Received: by 2002:a05:6102:26c6:b0:4ba:974c:891e with SMTP id
 ada2fe7eead31-4c856a500f2mr10901485137.17.1744072770217; Mon, 07 Apr 2025
 17:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Mon, 7 Apr 2025 17:38:53 -0700
X-Gm-Features: ATxdqUE4bl-iR9pG2iOR2KE1SbbhqMDbsvIwBBfgh2QnoOoNEzSXlElzwA4__qE
Message-ID: <CABayD+c7G2=3ysYWFLziFM7SEd3KLDzVbQNjUtk43rdeRrf8qw@mail.gmail.com>
Subject: Kernel SIG meeting 4/10 - Open Agenda
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

We have an instance of the Kernel SIG coming up, at 9AM PDT on
Thursday, April 10th (6PM CEST).

We currently have an open agenda, please make suggestions for topics.
In particular, if you have any topics that have been challenging to
resolve on list, this may be a good forum to hash things out.

Zoom link - https://zoom-lfx.platform.linuxfoundation.org/meeting/92401169243?password=e6c02995-6cfb-4f90-82b6-747f767eb168
Agenda - https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzvIlK2_bd4/edit?tab=t.0
Calendar - https://confidentialcomputing.io/get-involved/calendar/

Thanks,
Steve
