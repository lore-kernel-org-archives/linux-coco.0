Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793493536;
	b=KNXAosHp7EK+WnZo9o+CBC8qn4G1uctAXimDau+cl6StgMS4eypUAa62Y1enACQqk3WB
	 8Knd5Xntn4D0zPKPHc4Bp/ctVCjQx76F4TbgVIR7rYZeb2bFk2fCy/o+LZYep6rSubrne
	 oTuQZaLtf20ufeVkEHtwzTcrZMTg7/L8KPBMm5BKfeeUc1bmbk9Y5uIXNPtMS1F2wgJX0
	 igX3JSn8Er5TjWprfGBCQm4iDqTexPls3Xc0xgqBLHb1PZGl5HAiqSdNTUACcBrls+Hgo
	 Eivxl62i3gtI37hjzWtuio7gAgOLmi1GxAtw1o7vHSE9nPk/j76/C3v0BiILK9VZHGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793493536;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Spam-Status:X-Rspamd-Server:
	 X-Stat-Signature:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 X-HE-Tag:X-HE-Meta;
	bh=2NTztGF26GvKO0/bkQXKVX509oc+Xe4ciubHbw6x/mU=;
	b=j6pWd9UluhGSOBLSPDmfZpwTRnB186Jkv+eqgY4JI5yD7orjymd5aHy4oAcpnyM2Bfn7
	 y1xi9sGKCwjpdj9MTH1W69uMgizj800CQ4Tk3A5fIerJ3yA0oAbXH652Ri5drU5on/JRX
	 LOixkDi9B9ArH3ag4qjkIyQ3FbKGmuXzBVIG/4Gc9MOOpvsKGNEPoO8R+4D+/cMbf9heP
	 Npgn5PkaCE158d6MCEjgqDi1BwQB6FutLWcHiaI37+43k2ZbMACxyOn4sRwDW54J/xtri
	 DBSkEbckz0/cMsOENN18Q1DhY04RV4QaROMTBkxK1dxDmMb9gtSI/pjT2exRwluWxsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED81606A31A
	for <linux-coco@lists.linux.dev>; Sun,  1 Nov 2026 00:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED81606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf07.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 5A9021A0838;
	Sun,  1 Nov 2026 00:38:53 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id C226E2002C;
	Sun,  1 Nov 2026 00:38:47 +0000 (UTC)
Message-ID: <5ad69a1167fddc7caf1eb73e439765116db1ce17.camel@perches.com>
Subject: Re: [PATCH -v2] MAINTAINERS: Fix Intel TDX kernel file patterns
From: Joe Perches <joe@perches.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe	
 <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Krzysztof Kozlowski	 <krzk@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, "biju.das.au"	 <biju.das.au@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org"	 <linux-serial@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org"	 <linux-renesas-soc@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,  "linux-coco@lists.linux.dev"	
 <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
 Au Dang <au.dang.jx@renesas.com>
Date: Sat, 31 Oct 2026 17:38:46 -0700
In-Reply-To: <20261031235958.GDauaA_pScrsk2xYUF@fat_crate.local>
References: 
	<TY3PR01MB11346BAE55FF22F66E86A6F8B86602@TY3PR01MB11346.jpnprd01.prod.outlook.com>
	 <afdf1864-4721-4177-bc18-2a5821d97559@kernel.org>
	 <20261027205411.GAauEPc4AtLwvrDfFr@fat_crate.local>
	 <7b0a2e98-c614-4cdd-8604-3b5b21e8474f@kernel.org>
	 <20261028154743.GCauIZH3pZm24jCX9b@fat_crate.local>
	 <20261030023338.GGauQCAuYyXGwIhlqX@fat_crate.local>
	 <20261031030112.GHauVZ-OI2KjdkjrcY@fat_crate.local>
	 <35ba539820e1782bde038df98d3b49295eb7cd3a.camel@perches.com>
	 <20261031202741.GAauZPPfNDpQLSmIZD@fat_crate.local>
	 <94f0ab99b5c9072ce7c026672f704b2987db427f.camel@perches.com>
	 <20261031235958.GDauaA_pScrsk2xYUF@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout06
X-Stat-Signature: 9qg86nfazz3m68n631948ftn5cfi9j79
X-Rspamd-Queue-Id: C226E2002C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/+wDw/0eI1zwSzjIvGXZ69wAnTk9DXqaY=
X-HE-Tag: 1793493527-313710
X-HE-Meta: U2FsdGVkX184D06UuHRutAh3RSj4qWrKeaNZYoK4fFL5V54we/zJTGTNU2Bd0MrOnqvxigZeYWqTot/MAgciRnJwE1ziXvp8eFCNc0jJoz/UFHBmQw0oubQKIvPxZ8U+b/dvE5D38uE7wHuFJPikNZQxI8VELGE3VXX5TS+1wN4pHmCJD+7s/jwR5lXHmSmcWchV3mgaIg0mhkqZhi5pX1k7Y5O5R64/ZUhzkC96ssaR9suqXEsRzGoRBxDGi2WAg+g/baYHKX1QnAjmrqz4Gb+HzqcN3qj2yloee9UC5dyC5jfEC8JOeLXPQ/efJCn1

On Sat, 2026-10-31 at 16:59 -0700, Borislav Petkov wrote:
> On Sat, Oct 31, 2026 at 03:52:50PM -0700, Joe Perches wrote:
> > Please add a wildcard * at the end
>=20
> I will, once the rationale is clear and documented so that people know wh=
at to
> do in the future.

MAINTAINERS currently has:

	F: *Files* and directories wildcard patterns.
	   A trailing slash includes all files and subdirectory files.
	   F:	drivers/net/	all files in and below drivers/net
	   F:	drivers/net/*	all files in drivers/net, but not below
	   F:	*/net/*		all files in "any top level directory"/net
	   F:	fs/**/*foo*.c	all *foo*.c files in any subdirectory of fs

How would you make that clearer?
