Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD425D75A
	for <linux-coco@lists.linux.dev>; Thu, 14 Mar 2024 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710427489; cv=none; b=fQZxMX1aIWZMS6lJhMzSN4SPImkF63wHXawfwnXSdcE7UVbh/P2jn3sdfnIFWMqAueC3R+qYyssGenamBxrhHKfV6qkV75CXaEd5wN7TzuhgdGKinq2xLqdfl997lljRLX9Q32NCgusp3eAqcwgfsANbHFpa5iQgiMuqSp3cMMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710427489; c=relaxed/simple;
	bh=NMU1o5HTSN8heZw0ktuw5A5NjoDzqs44cHYJS7DvABA=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=JkYUCGTkxHnXDiqpWxGG4K47BJk0N5XubZUqhDHYQCENx3bYEcBZLuahRj04ApYlMSdU1l+D15lUOOL+p27paMcSnJk8hOIvMyoRbC2jbCJhbQ09E8UwkuTy8ZfLpUW6k4sIeKolg8b6vSsfSwxm2b2a2CleaccTAfWaEkvEMUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=6D0xTnln; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="6D0xTnln"
Received: from smtpclient.apple (p4ffe0c3c.dip0.t-ipconnect.de [79.254.12.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 12E041E2546;
	Thu, 14 Mar 2024 15:44:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1710427479;
	bh=NMU1o5HTSN8heZw0ktuw5A5NjoDzqs44cHYJS7DvABA=;
	h=From:Subject:Date:Cc:To:From;
	b=6D0xTnlnfAdVnhj+3oujVPK+BUvV95XRegbTGz6sv3VbVMwiq7lDWiNhbSsalyQsL
	 C3DdzvPZ6Yw2tFf+9/gkgtzQSYdJ/Yu9Ru77815RuorK1zcBMGPP6JQnwyY0Kyz6Yp
	 3MJidk9TtsId7EEH4mR6GRdI/0w2Lom/2J6SiPyg2Byf7sLkvY+yKgMKV8Z54P8E+L
	 8zrubCgS2K+J3yFk3dRkRnNH4X9nsm7dz4jDY6P2tNEMV18ew6FEeJF/vERrELdNn8
	 2YxL7Cb2u1gjHov94wuilGwjhnmoOJdSbLsRXNHn0AIFfsXLGvrdwA1EfNcKSHvQAx
	 cm4Y7eJg4k0pA==
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: SVSM vTPM state
Message-Id: <4C094744-BB2C-4102-9593-67B8C38E0C97@8bytes.org>
Date: Thu, 14 Mar 2024 15:44:25 +0100
Cc: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
To: svsm-devel@coconut-svsm.dev,
 linux-coco@lists.linux.dev
X-Mailer: Apple Mail (2.3774.400.31)

Hi,

In the last days I looked at Claudio=E2=80=99s vTPM PR and tested it.  =
That went well and I left a few minor review comments, other than that =
the changes look good to go.

This means, if there are no further objections, I *plan* to merge the =
code into the SVSM main branch next week (not before our development =
call). This gives everyone some time for final review and testing to =
make the merge as smooth as possible. If there are any objections, =
please raise them in the PR or via email.

 As a side note, I already updated the Linux and EDK2 repositories in =
the COCONUT project to include the vTPM drivers.

Regards,

J=C3=B6rg=
